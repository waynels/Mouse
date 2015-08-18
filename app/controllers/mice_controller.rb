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
  def download_mice
    if current_user.has_role?(:PI)
      @mice = Mouse.alive_mice
    else
      @mice = current_user.mice.alive_mice
    end
    @strain_ids = @mice.select(:strain_id).group(:strain_id)
    respond_to do |format|  
      format.html {render :partial => "download_mice" }
      format.xls  
      headers["Content-Disposition"] = "attachment; filename=\"mice_#{Time.now.strftime("%Y%m%d%H%M%S")}.xls\""
    end  
  end

  #<%= select_tag "mouse_life_status", options_for_select([ "alive", "not_alive" ], "alive"), :class => " input-small" %> 
  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "mice.code","strains.common_name",["mice.birthday"],["mice.wean_date"], "mice.sex","mice.father_id","mice.mother_id", "baskets.code","mice.generation","mice.life_status","users.full_name", ["mice.created_at"]]
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
    if params[:status]
      if params[:status] == "alive"
        condition = "life_status = 'A'"
      elsif params[:status] == "not_alive"
        condition = "life_status <> 'A'"
      end
    else
      condition =  "life_status = 'A'"
    end
    if current_user.has_role?(:PI)
    total = Mouse.where(condition).size
    filter_total = Mouse.includes(:strain , :basket, :onwer).where(condition_str).where(condition).references(:strain, :basket, :onwer).size
    @mice = Mouse.includes(:strain , :basket, :onwer).where(condition_str).where(condition).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i).references(:strain, :basket, :onwer)
    else
    total = current_user.mice.where(condition).size
    filter_total = current_user.mice.includes(:strain , :basket, :onwer).where(condition_str).where(condition).references(:strain, :basket, :onwer).size
    @mice = current_user.mice.includes(:strain , :basket, :onwer).where(condition_str).where(condition).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i).references(:strain, :basket, :onwer)
    end
    arr = []
    @mice.each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{mouse_path(item)}' data-remote=true class='btn btn-mini'>查看</a>"
        op_str = op_str + " <a href='#{parents_tree_mouse_path(item)}'data-remote=true class='btn btn-mini'>传代</a>"
      end 
      if can? :manage, item 
        if item.life_status == "A" 
          op_str = op_str + " <a href='#{want_to_do_mouse_path(item)}' data-remote=true class='btn btn-mini'>ToDo</a>"
          if can? :update, item 
            op_str = op_str + " <a href='#{edit_mouse_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
            if item.can_destroy
              op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{mouse_path(item)}'>删除</a>"
            end
          end
        end
      end
      if current_user.has_role?(:PI)
        basket_code = item.basket ? "#{Framework.all.index(item.basket.framework)+1}-#{item.basket.code}(#{item.basket.basket_type_label})" : nil
      else
        if item.onwer == current_user
          basket_code = item.basket ? "#{Framework.all.index(item.basket.framework)+1}-#{item.basket.code}(#{item.basket.basket_type_label})" : nil
        else
          basket_code = "-"
        end
      end
      code = "#{item.code}"
      if item.life_status == "A"
        status_lable = "#{item.life_status_lable}"
      else
        status_lable = "#{item.life_status_lable}[#{item.dead_date ? item.dead_date : 'Date Lose'}]"
      end
        arr << [code, item.strain ? item.strain.common_name : nil, "#{item.birthday}(#{item.mouse_age})", item.wean_date, item.show_sex, item.father_mouse ? item.father_mouse.code : nil, item.mother_mouse ? item.mother_mouse.code : nil, basket_code,item.generation,status_lable, item.onwer.try(:full_name), op_str]
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
            breed.cancel_date = Time.now.strftime("%Y-%m-%d")
            breed.save
          end
        elsif @mouse.sex == "F"
          breed = Breed.where(basket_id: @basket.id, mother_id: @mouse.id, is_usable: true).last
          if breed
            breed.is_usable = false
            breed.cancel_date = Time.now.strftime("%Y-%m-%d")
            breed.save
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
                breed = Breed.create(basket_id: @basket.id,father_id: @mouse.id, mother_id: f.id,cage_at: Time.now.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
              end
              @return_info = "Mate"
            elsif @mouse.sex == "F"
              male = @basket.mice.alive_mice.male_mice.first
              if male
              breed = Breed.create(basket_id: @basket.id,father_id: male.id, mother_id: @mouse.id,cage_at: Time.now.strftime("%Y-%m-%d"), is_usable: true, created_by: current_user.id)
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

  def parents_tree
    @mouse = Mouse.find(params[:id])
  end

  def get_parents_tree 
    @mouse = Mouse.find(params[:id])
    alleles_str = ""
    @mouse.mouse_genes.each do |gene|
      alleles_str = alleles_str + "#{@mouse.strain.genes.find(gene.id).short_name}: #{@mouse.alleles.find_by_gene_id(gene.id).try(:name)}"
    end
    if @mouse.sex == "M"
      data = {"name" => @mouse.code ? "#{@mouse.code}♂(#{@mouse.strain.common_name})" : "未编号", "born" => @mouse.birthday,"location" => alleles_str, "parents" => get_parents(@mouse, 0)}
    elsif @mouse.sex == "F"
      data = {"name" => @mouse.code ? "#{@mouse.code}♀(#{@mouse.strain.common_name})" : "未编号", "born" => @mouse.birthday, "location" => alleles_str,"parents" => get_parents(@mouse, 0)}
    else
      data = {"name" => @mouse.code ? "#{@mouse.code}♀(#{@mouse.strain.common_name})" : "Litter", "born" => @mouse.birthday,"location" => alleles_str, "parents" => get_parents(@mouse, 0)}
    end
    render :json => data
  end

  def get_family_tree 
    user = User.find(current_user.id)
    @mouse = Mouse.find(params[:id])
    alleles_str = ""
    @mouse.alleles.each do |allele|
        alleles_str = alleles_str + "#{Gene.find(allele.gene_id).short_name}: #{allele.name}\n\t\s\s\s"
    end
    description = "
    Father: #{@mouse.father_mouse.try(:code)}
    Mother: #{@mouse.mother_mouse.try(:code)}
    Birthday: #{@mouse.birthday}(#{@mouse.mouse_age})
    #{alleles_str}
    "
    description = description.html_safe
    data = {"name" => @mouse.code ? "#{@mouse.code}#{@mouse.show_sex}(#{@mouse.strain.common_name})" : "未知",  "description" => description, "dead" => @mouse.is_deaded, "children" => get_tree(@mouse, 0)}
    render :json => data
  end

  def 
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
      format.js
    end
  end

  protected

  def get_parents(mouse, i)
    data = []
    i = i + 1
    if i < 4
      if mouse.father_id
        father = mouse.father_mouse
        alleles_str = ""
        father.mouse_genes.each do |gene|
          alleles_str = alleles_str + "#{father.strain.genes.find(gene.id).short_name}: #{father.alleles.find_by_gene_id(gene.id).try(:name)}"
        end
        if father.father_id 
          father_hash = {"name" => father.code ? "#{father.code}♂(#{father.strain.common_name})" : "未编号", "born" => father.birthday,"location" => alleles_str, "parents" => get_parents(father, i)}
        else
          father_hash = {"name" => father.code ? "#{father.code}♂(#{father.strain.common_name})" : "未编号", "born" => father.birthday,"location" => alleles_str}
        end
      else
        father_hash = {"name" => "未知♂" }
      end
      if mouse.mother_id
        mother = mouse.mother_mouse 
        alleles_str = ""
        mother.mouse_genes.each do |gene|
          alleles_str = alleles_str + "#{mother.strain.genes.find(gene.id).short_name}: #{mother.alleles.find_by_gene_id(gene.id).try(:name)}"
        end
        if mother.mother_id 
          mother_hash = {"name" => mother.code ? "#{mother.code}♀(#{mother.strain.common_name})" : "未编号", "born" => mother.birthday,"location" => alleles_str, "parents" => get_parents(mother, i)}
        else
          mother_hash = {"name" => mother.code ? "#{mother.code}♀(#{mother.strain.common_name})" : "未编号", "born" => mother.birthday,"location" => alleles_str}
        end
      else
        mother_hash = {"name" => "未知♀"}
      end
      data = [father_hash, mother_hash]
      return data
    end
  end

  def get_tree( mouse, i)
    data = []
    i = i + 1
    if mouse.sex == "M"
      cmice = Mouse.where(father_id: mouse.id)
      cmice.each do |m|
        alleles_str = ""
        m.alleles.each do |allele|
          alleles_str = alleles_str + "#{Gene.find(allele.gene_id).short_name}: #{allele.name}\n\t\s\s\s"
        end
        description = "
           Father: #{m.father_mouse.try(:code)}
           Mother: #{m.mother_mouse.try(:code)}
           Birthday: #{m.birthday}(#{m.mouse_age})
           #{alleles_str}
           "
        if m.children_mice > 0
          father_hash = {"name" => "#{m.code}#{m.show_sex}(#{m.strain.common_name})", 'description' => description, "dead" => m.is_deaded, "children" => get_tree(m, i)}
        else
          father_hash = {"name" => "#{m.code}#{m.show_sex}(#{m.strain.common_name})", 'description' => description, "dead" => m.is_deaded}
        end
        data << father_hash
      end
    elsif mouse.sex == "F"
      cmice = Mouse.where(mother_id: mouse.id)
      cmice.each do |m|
      alleles_str = ""
        m.alleles.each do |allele|
          alleles_str = alleles_str + "#{Gene.find(allele.gene_id).short_name}: #{allele.name}\n\t\s\s\s"
        end
        description = "
           Father: #{m.father_mouse.try(:code)}
           Mother: #{m.mother_mouse.try(:code)}
           Birthday: #{m.birthday}(#{m.mouse_age})
           #{alleles_str}
           "
        if m.children_mice > 0
          father_hash = {"name" => "#{m.code}#{m.show_sex}(#{m.strain.common_name})", 'description' => description, "dead" => m.is_deaded, "children" => get_tree(m, i)}
        else
          father_hash = {"name" => "#{m.code}#{m.show_sex}(#{m.strain.common_name})", 'description' => description, "dead" => m.is_deaded}
        end
        data << father_hash
      end
    else
      alleles_str = ""
      mouse.alleles.each do |allele|
        alleles_str = alleles_str + "#{Gene.find(allele.gene_id).short_name}: #{allele.name}\n\t\s\s\s"
      end
      description = "
         Father: #{mouse.father_mouse.try(:code)}
         Mother: #{mouse.mother_mouse.try(:code)}
         Birthday: #{mouse.birthday}(#{mouse.mouse_age})
         #{alleles_str}
         "
      father_hash = {"name" => "#{mouse.id}-#{mouse.code}L(#{mouse.strain.common_name})", 'description' => description, "dead" => mouse.is_deaded}
      data = [father_hash]
    end
    p data
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
