#encoding: utf-8
class MiceController < ApplicationController
  before_action :set_mouse, only: [:show, :edit, :update, :destroy]

  # GET /mice
  # GET /mice.json
  def index
  end

  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "mice.code","mice.strain_id","mice.generate_num","mice.birthday","mice.weaningday", "mice.gender","mice.father_code","mice.mother_code", "mice.basket_id","mice.identification", "mice.gfp", "mice.gfp_val", ["mice.created_at"]]
    data = get_datatable_data(column, "Mouse")
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
      if item.strain
      arr << [item.code, item.strain.name,item.generate_num, item.birthday, item.weaningday, item.gender, item.father_code, item.mother_code,item.basket.code, item.identification, item.gfp, item.gfp_val, op_str]
      else
      arr << [item.code, nil,item.generate_num, item.birthday, item.weaningday, item.gender, item.father_code, item.mother_code,item.basket.code, item.identification, item.gfp, item.gfp_val, op_str]
      end
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  def autocomplete 
    sex = params[:sex]
    respond_to do |format|
      ar = Mouse.where(is_survival: true,gender: sex).collect{|m| {:id => m.id, :value => m.code, :label => "#{m.code}--#{m.strain.name}--#{m.birthday}--#{m.gender}"} }
      format.json {render :json=>ar}
    end
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

    respond_to do |format|
      if @mouse.save
        format.html { redirect_to @mouse, notice: 'Mouse was successfully created.' }
        format.json { render :show, status: :created, location: @mouse }
      else
        format.html { render :new }
        format.json { render json: @mouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mice/1
  # PATCH/PUT /mice/1.json
  def update
    respond_to do |format|
      if @mouse.update(mouse_params)
        format.html { redirect_to @mouse, notice: 'Mouse was successfully updated.' }
        format.json { render :show, status: :ok, location: @mouse }
      else
        format.html { render :edit }
        format.json { render json: @mouse.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mouse
      @mouse = Mouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mouse_params
      params[:mouse].permit(:basket_id, :strain_id, :generate_num, :birthday, :weaningday, :gender, :code, :identification, :gfp, :gfp_val, :father_code, :mother_code)
    end
end
