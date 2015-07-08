#encoding: utf-8
class MiceController < ApplicationController
  before_action :set_mouse, only: [:show, :edit, :update, :destroy]

  # GET /mice
  # GET /mice.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end

  #<%= select_tag "mouse_life_status", options_for_select([ "alive", "not_alive" ], "alive"), :class => " input-small" %> 
  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "mice.code","strains.common_name",["mice.birthday"],["mice.wean_date"], "mice.sex","mice.father_id","mice.mother_id", "baskets.code","mice.generation","mice.is_dead","users.full_name", ["mice.created_at"]]
    if params[:order]
      order_column = params[:order]["0"][:column].to_i
      dir = params[:order]["0"][:dir]
    else
      order_column = 0
      dir = "asc"
    end
    order = column[order_column].class == Array ? column[order_column][0] : column[order_column]

    search_conditions = []
    column.each do |c|
      if c.class == Array
        # gen_like_condition search_conditions, "Date(#{c[0]})", key
      else
        gen_like_condition search_conditions, c, key
      end
    end
    condition_str = search_conditions.join(' or ')
    p condition_str
    if params[:status]
      if params[:status] == "alive"
        condition = "life_status = 'A'"
      elsif params[:status] == "not_alive"
        condition = "life_status <> 'A'"
      end
    else
      condition =  "life_status = 'A'"
    end
    total = Mouse.where(condition).size

    filter_total = Mouse.includes(:strain , :basket, :onwer).where(condition_str).where(condition).references(:strain, :basket, :onwer).size
    @mice = Mouse.includes(:strain , :basket, :onwer).where(condition_str).where(condition).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i).references(:strain, :basket, :onwer)
    arr = []
    @mice.each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{mouse_path(item)}' data-remote=true class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        if item.life_status == "A" 
          op_str = op_str + " <a href='#{want_to_do_mouse_path(item)}' data-remote=true class='btn btn-mini'>ToDo</a>"
        if can? :update, item 
          op_str = op_str + " <a href='#{edit_mouse_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{mouse_path(item)}'>删除</a>"
        end
        end
      end
      if current_user.has_role?(:PI)
        basket_code = item.basket ? "#{Framework.all.index(item.basket.framework)+1}-#{item.basket.code}" : nil
      else
        if item.onwer == current_user
          basket_code = item.basket ? "#{Framework.all.index(item.basket.framework)+1}-#{item.basket.code}" : nil
        else
          basket_code = "-"
        end
      end
      arr << [item.code, item.strain ? item.strain.common_name : nil, item.birthday, item.wean_date, item.show_sex, item.father_mouse ? item.father_mouse.code : nil, item.mother_mouse ? item.mother_mouse.code : nil, basket_code,item.generation,item.is_dead, item.onwer.try(:full_name), op_str]
    end
    json = {"draw" => 0, "recordsTotal" => total, "recordsFiltered" => filter_total, "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end


  def change_strain 
    @strain = Strain.find(params[:strain_id])
  end

  def want_to_do 
    @mouse = Mouse.find(params[:id])
    @todo_list = TodoList.new
  end

  def remove_out  
    mouse_id = params[:id].split("_")[1]
    @mouse = Mouse.find(mouse_id)
    @basket = Basket.find(params[:basket_id])
    @mouse.basket_id = nil
    @mouse.save
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
  end
  def remove_in
    mouse_id = params[:id].split("_")[1]
    @mouse = Mouse.find(mouse_id)
    @basket = Basket.find(params[:basket_id])
    @mouse.basket_id = @basket.id 
    @mouse.save
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
  end

  def mouse_remove 
    mouse_id = params[:id].split("_")[1]
    @mouse = Mouse.find(mouse_id)
    @basket = Basket.find(params[:basket_id])
    if params[:move_type] == "remove_out"
      if @basket.cage_type == "M" 
        if @mouse.sex == "M"
          breed = Breed.where(basket_id: @basket.id, father_id: @mouse.id, is_usable: true).last
          if breed
            breed.is_usable = false
            breed.save
            p breed
          end
        elsif @mouse.sex == "F"
          breed = Breed.where(basket_id: @basket.id, mother_id: @mouse.id, is_usable: true).last
          if breed
            breed.is_usable = false
            breed.save
            p breed
          end
        else
        end
      else
      end
      @mouse.basket_id = nil
      @return_info = "Move_Out"
    else
      #判断小鼠能否拖入笼子内
      if aduit_mouse_to_cage(@mouse, @basket)
        p "1111111111111"
        #判断笼子属性做相应的事情
        if @basket.cage_type == "M"
          #弹出窗口录入相应信息提交表单
          #mating_mouse_to_cage(mouse, cage)
          #
          if @basket.mice.alive_mice.size > 0
            if @mouse.sex == "M"
              females = @basket.mice.alive_mice.female_mice
              females.each do |f|
                breed = Breed.create(basket_id: @basket.id,father_id: @mouse.id, mother_id: f.id,cage_at: Time.now.strftime("%Y-%m-%d"),created_by: current_user.id)
              end
              @return_info = "Mate"
            elsif @mouse.sex == "F"
              male = @basket.mice.alive_mice.male_mice.first
              if male
              breed = Breed.create(basket_id: @basket.id,father_id: male.id, mother_id: @mouse.id,cage_at: Time.now.strftime("%Y-%m-%d"))
              @return_info = "Mate"
              else
              @return_info = "TRUE"
              end
            else
              @return_info = "TRUE"
            end
          else
            @return_info = "TRUE"
          end
        else
          @return_info = "TRUE"
        end
        @mouse.basket_id = @basket.id 
      else
        @return_info = "FALSE"
      end
    end
    @mouse.save
    @basket = Basket.find(params[:basket_id])
    @framework = @basket.framework
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
  end


  def family_tree
    @mouse = Mouse.find(params[:id])
  end

  def get_family_tree 
    user = User.find(current_user.id)
    @mouse = Mouse.find(params[:id])
    if @mouse.gender == "M"
      data = {"name" => @mouse.code ? "#{@mouse.code}♂" : "未编号", "children" => get_tree(@mouse, user)}
    else
      data = {"name" => @mouse.code ? "#{@mouse.code}♀" : "未编号", "children" => get_tree(@mouse, user)}
    end
    render :json => data
  end
  # GET /mice/1
  # GET /mice/1.json
  def show
  end

  # GET /mice/new
  def new
    @mouse = Mouse.new
  end

  # GET /mice/1/edit
  def edit
  end

  # POST /mice
  # POST /mice.json
  def create
    @mouse = Mouse.new(mouse_params)

    @mouse.onwer_id = current_user.id
    @mouse.created_by = current_user.id

    respond_to do |format|
      if @mouse.save

        arr = []
        @mouse.strain.genes.each do |gene|
          arr << params["gene_allele_#{gene.id}"]
        end
        p arr
        @mouse.allele_ids = arr.uniq
        format.js
        #        format.html { redirect_to @mouse, notice: 'Mouse was successfully created.' }
        #        format.json { render :show, status: :created, location: @mouse }
      else
        format.html { render :new }
        format.json { render json: @mouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mice/1
  # PATCH/PUT /mice/1.json
  def update
    @mouse.update(mouse_params)
    arr = []
    @mouse.strain.genes.each do |gene|
      arr << params["gene_allele_#{gene.id}"]
    end
    p arr
    @mouse.allele_ids = arr.uniq
    #    respond_to do |format|
    #      if @mouse.update(mouse_params)
    #        format.html { redirect_to @mouse, notice: 'Mouse was successfully updated.' }
    #        format.json { render :show, status: :ok, location: @mouse }
    #      else
    #        format.html { render :edit }
    #        format.json { render json: @mouse.errors, status: :unprocessable_entity }
    #      end
    #    end
  end

  # DELETE /mice/1
  # DELETE /mice/1.json
  def destroy
    @mouse.destroy
    respond_to do |format|
      format.html { redirect_to mice_url, notice: 'Mouse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def get_tree( mouse, user)
    data = []

    if mouse.father_id
      father = mouse.father_mouse
      if father.father_id or father.father_code
        father_hash = {"name" => "#{father.code}♂",  "children" => get_tree( father, user)}
      else
        father_hash = {"name" => "#{father.code}♂"}
      end
    else
      father_hash = {"name" => mouse.father_code ? "#{mouse.father_code}♂" : "WT♂" }
    end
    if mouse.mother_id
      mother = mouse.mother_mouse 
      if mother.mother_id or mother.mother_code
        mother_hash = {"name" => "#{mother.code}♀",  "children" => get_tree( mother, user)}
      else
        mother_hash = {"name" => "#{mother.code}♀"}
      end
    else
      mother_hash = {"name" => mouse.mother_code ? "#{mouse.mother_code}♀" : "WT♀"}
    end
    data = [father_hash, mother_hash]
    return data
  end
  def aduit_mouse_to_cage(mouse,cage)
    if cage.cage_type =="M"
      if cage.mice.alive_mice.size > 0
        if mouse.sex == "M" and cage.mice.alive_mice.male_mice.size == 0
          return true
        elsif mouse.sex == "F"
          return true
        elsif (mouse.sex == "" or mouse.sex == nil)
          mother_litter = false 
          p mother_litter
          cage.mice.alive_mice.female_mice.each do |female|
            if female.id == mouse.mother_id
              mother_litter = true
            end
          end
          p mother_litter
          return mother_litter 
        end
      else
        if (mouse.sex == "" or mouse.sex == nil)
          return false 
        else
          return true
        end
      end
    elsif cage.cage_type == "S"
      if cage.mice.alive_mice.size > 0
        if mouse.sex == "M" and cage.mice.alive_mice.female_mice.size == 0
          return true
        elsif mouse.sex == "F" and cage.mice.alive_mice.male_mice.size == 0
          return true
        else
          return false
        end
      else
        if (mouse.sex == "" or mouse.sex == nil)
          return false 
        else
          return true
        end
      end
    elsif cage.cage_type == "B" 
      if cage.mice.alive_mice.size > 0
        if (mouse.sex == "" or mouse.sex == nil)
          mother = cage.mice.alive_mice.female_mice.first
          if mother
            if mother.id == mouse.mother_id
              return true
            end
          end
        else
          return false
        end
      else
        if mouse.sex == "F" and mouse.f_breeds.size > 0
          return true
        else
          return false 
        end
      end
    else
        return true
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_mouse
    @mouse = Mouse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mouse_params
    params[:mouse].permit(:basket_id, :strain_id, :generation, :birthday, :wean_date, :sex, :code, :life_status, :coat_color, :dead_date, :mother_id, :father_id, :batch_id,:dead_date , :dead , :onwer_id , :created_by, :is_dead, :description)
  end
end
