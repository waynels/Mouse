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
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:full_name, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation, :current_password) }
  end
end
