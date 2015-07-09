class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
    #render :js => "window.location.href=#{root_url}"
  end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def check_token  
  #   if session[:__token__] == params[:__token__]  
  #     session[:__token__] = nil  
  #     session.update  
  #     return true  
  #   end  
  #   false  
  # end  
  def to_time(time)
    unless time==nil
      to_time=time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
  def to_date(date)
    unless date==nil
      to_date=date.strftime('%Y-%m-%d')
    end
  end
  #以下方法用于生成sql的子条件
  def gen_like_condition(conditions, col_name, value)
    conditions << %Q{#{col_name} like "%#{value}%"} if value and !value.empty?
  end
  def gen_eqlstr_condition(conditions, col_name, value)
    conditions << "#{col_name}='#{value}'" if value and !value.empty?
  end
  def gen_eql_condition(conditions, col_name, value)
    conditions << "#{col_name}=#{value}" if value
  end
  def gen_in_condition(conditions, col_name, value)
    conditions << "#{col_name} in (#{value.join(',')})" if value and !value.empty?
  end
  def gen_in_str_condition(conditions, col_name, value)
    conditions << "#{col_name} in ('#{value.join('\',\'')}')" if value and !value.empty?
  end
  def gen_in_between_date_condition(conditions, col_name, start_date, end_date)
    conditions << "#{col_name}>='#{start_date}'" if start_date and !start_date.empty?
    conditions << "#{col_name}<='#{end_date}'" if end_date and !end_date.empty?
  end
  def get_datatable_data(column, model, condition)
    if model.class == String
      model = model
    else
      model2 = model[1]
      model = model[0]
    end
    key = params[:search][:value] if params[:search]

    if params[:order]
      order_column = params[:order]["0"][:column].to_i
      dir = params[:order]["0"][:dir]
    else
      order_column = 0
      dir = "asc"
    end
    order = column[order_column].class == Array ? column[order_column][0] : column[order_column]
    if condition 
      total = model.constantize.where(condition).size
    else
      total = model.constantize.all.size
    end
    search_conditions = []
    column.each do |c|
      if c.class == Array
        #gen_like_condition search_conditions, "Date(#{c[0]})", key
      else
        gen_like_condition search_conditions, c, key
      end
    end
    condition_str = search_conditions.join(' or ')
    if model2
      filter_total = model.constantize.joins(model2).where(condition_str).size
      data = model.constantize.joins(model2).where(condition_str).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i)
    else
      filter_total = model.constantize.where(condition_str).where(condition).size
      data = model.constantize.where(condition_str).where(condition).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i)
    end
    return data, total, filter_total
  end
  def exchange_mouses(basket, mouse, m_old_basket)
    if basket.use_type == "B"
      if mouse.gender == "M"
        if basket.mice.where(gender: "M").size > 0
          old_m_m = basket.mice.where(gender: "M").first
          old_m_m.basket_id = mouse.basket_id
          old_m_m.save
          #取消当前公老鼠的配对的关系
          this_old_breeds = Breed.where(father_id: old_m_m.id,basket_id: basket.id)
          this_old_breeds.each do |e|
            e.is_usable = false
            e.save
          end
          #取消进来老鼠原位置笼子老鼠之间的关系
          that_old_breeds = Breed.where(father_id: mouse.id, basket_id: m_old_basket.id)
          that_old_breeds.each do |t|
            t.is_usable = false
            t.save
          end
          #若原笼子为繁殖笼子则创建新的配对信息
          if m_old_basket
            if m_old_basket.use_type == "B"
              if m_old_basket.mice.where(gender: "F").size > 0
                m_old_basket.mice.where(gender: "F").each do |f_m|
                  breed = Breed.create(basket_id: m_old_basket.id,father_id: old_m_m.id, mother_id: f_m.id,cage_at: Time.new.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
                end
              end
            end
          end
          #创建新小鼠与该笼子中母鼠的配对关系
          basket.mice.where(gender: "F").each do |f_m|
            breed = Breed.create(basket_id: basket.id,father_id: mouse.id, mother_id: f_m.id,cage_at: Time.new.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
          end
        else
          basket.mice.where(gender: "F").each do |f_m|
            breed = Breed.create(basket_id: basket.id,father_id: mouse.id, mother_id: f_m.id,cage_at: Time.new.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
          end
          #进来老鼠原位置笼子老鼠之间的配对关系打断
          that_old_breeds = Breed.where(father_id: mouse.id, basket_id: m_old_basket.id)
          that_old_breeds.each do |t|
            t.is_usable = false
            t.save
          end
        end
      else
        m_m = basket.mice.where(gender: "M").first
        if m_m
          breed = Breed.create(basket_id: basket.id,father_id: m_m.id, mother_id: mouse.id,cage_at: Time.new.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
        end
        #进来老鼠原位置笼子公老鼠的配对关系打断
        old_breeds = Breed.where(mother_id: mouse.id, basket_id: m_old_basket.id)
        old_breeds.each do |o|
          o.is_usable = false
          o.save
        end
      end
      mouse.basket_id = basket.id
    else
      mouse.basket_id = basket.id
      if m_old_basket
        #打断原有繁殖关系
        if m_old_basket.use_type == "B"
          if mouse.gender == "M"
            old_breeds = Breed.where(father_id: mouse.id, basket_id: m_old_basket.id)
            old_breeds.each do |o|
              o.is_usable = false
              o.save
            end
          else
            old_breeds = Breed.where(mother_id: mouse.id, basket_id: m_old_basket.id)
            old_breeds.each do |o|
              o.is_usable = false
              o.save
            end
          end
        end
      end
    end
    mouse.save
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:full_name, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation, :current_password) }
  end
end
