#encoding: utf-8
class StrainsController < ApplicationController
  before_action :set_strain, only: [:show, :edit, :update, :destroy]

  # GET /strains
  # GET /strains.json
  def index
    @strains = Strain.all
  end

  def get_data
    key = params[:search][:value] if params[:search]
    column = ["strains.id", "strains.name", "strains.description", ["strains.created_at"]]
    data = get_datatable_data(column, "Strain")
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{strain_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_strain_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{strain_path(item)}'>删除</a>"
      end
      arr << [item.id, item.name, item.description, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  # GET /strains/1
  # GET /strains/1.json
  def show
  end

  # GET /strains/new
  def new
    @strain = Strain.new
  end

  # GET /strains/1/edit
  def edit
  end

  # POST /strains
  # POST /strains.json
  def create
    @strain = Strain.new(strain_params)

    respond_to do |format|
      if @strain.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strains/1
  # PATCH/PUT /strains/1.json
  def update
    respond_to do |format|
      if @strain.update(strain_params)
        format.html { redirect_to @strain, notice: 'Strain was successfully updated.' }
        format.json { render :show, status: :ok, location: @strain }
      else
        format.html { render :edit }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strains/1
  # DELETE /strains/1.json
  def destroy
    @strain.destroy
    respond_to do |format|
      format.html { redirect_to strains_url, notice: 'Strain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strain
      @strain = Strain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strain_params
      params[:strain].permit(:name, :description)
    end
end
