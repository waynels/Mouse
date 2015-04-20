#encoding: utf-8
class BreedsController < ApplicationController
  before_action :set_breed, only: [:show, :edit, :update, :destroy]

  # GET /breeds
  # GET /breeds.json
  def index
 #   @breeds = Breed.all
 #   respond_to do |format|
 #     format.html 
 #     format.json { head :no_content }
 #   end
  end

  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "breeds.father_id","breeds.mother_id","breeds.basket_id","breeds.cage_at","breeds.is_usable",["breeds.created_at"]]
    data = get_datatable_data(column, "Breed")
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{breed_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_breed_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{breed_path(item)}'>删除</a>"
      end
      arr << [item.father_id, item.mother_id,item.basket_id, item.cage_at, item.is_usable, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end
  # GET /breeds/1
  # GET /breeds/1.json
  def show
  end

  # GET /breeds/new
  def new
    @breed = Breed.new
  end

  # GET /breeds/1/edit
  def edit
  end

  # POST /breeds
  # POST /breeds.json
  def create
    @breed = Breed.new(breed_params)
    @breed.save
    respond_to do |format|
      format.js
    end

   # respond_to do |format|
   #   if @breed.save
   #     format.html { redirect_to breeds_url, notice: 'Breed was successfully created.' }
   #     format.json { render :show, status: :created, location: @breed }
   #   else
   #     format.html { render :new }
   #     format.json { render json: @breed.errors, status: :unprocessable_entity }
   #   end
   # end
  end

  # PATCH/PUT /breeds/1
  # PATCH/PUT /breeds/1.json
  def update
    respond_to do |format|
      if @breed.update(breed_params)
        format.html { redirect_to @breed, notice: 'Breed was successfully updated.' }
        format.json { render :show, status: :ok, location: @breed }
      else
        format.html { render :edit }
        format.json { render json: @breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeds/1
  # DELETE /breeds/1.json
  def destroy
    @breed.destroy
    respond_to do |format|
      format.html { redirect_to breeds_url, notice: 'Breed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breed
      @breed = Breed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breed_params
      params[:breed].permit(:father_id, :mother_id, :basket_id, :cage_at)
    end
end
