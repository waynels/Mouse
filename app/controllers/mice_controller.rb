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

  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "mice.code","mice.strain_id","mice.birthday","mice.wean_date", "mice.sex","mice.father_code","mice.mother_code", "mice.basket_id","mice.generation", ["mice.created_at"]]
    data = get_datatable_data(column, "Mouse", nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{mice_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_mouse_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{mouse_path(item)}'>删除</a>"
      end
      arr << [item.code, item.strain ? item.strain.common_name : nil, item.birthday, item.wean_date, item.sex, item.father_mouse ? item.father_mouse.code : nil, item.mother_mouse ? item.mother_mouse.code : nil,item.basket ? item.basket.code : nil,item.generation, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end


  def change_strain 
    @strain = Strain.find(params[:strain_id])
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
