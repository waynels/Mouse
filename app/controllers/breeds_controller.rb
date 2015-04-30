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
        op_str = op_str + " <a href='#{edit_breed_path(item)}' data-remote=true class='btn btn-mini'>废除</a>"
        op_str = op_str + " <a href='#{breed_path(item)}' data-remote=true class='btn btn-mini'>详细信息</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{breed_path(item)}'>删除</a>"
      end
      arr << ["#{item.father.code}[#{item.father.strain.name}]", "#{item.mother.code}[#{item.mother.strain.name}]",item.basket.code, item.cage_at, item.is_usable, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  def die_record

  end
  # GET /breeds/1
  # GET /breeds/1.json
  def show
    @batches = @breed.batches
    p @breed.breeds_infos.size
  end

  def cage
   @breed = Breed.find(params[:breed_id]) 
   @batch = Batch.find(params[:batch_id]) 
  end

  def cage_info
    @batch = Batch.find(params[:batch_id])
    @male_mice = Mouse.where(:batch_id => params[:batch_id], :gender => "M") 
    @female_mice = Mouse.where(:batch_id => params[:batch_id], :gender => "F") 
  end

  def appraisal_mouse 
    @mouse = Mouse.find(params[:mouse_id])
  end

  def save_mice_cage
   male_quantity = params[:male_quantity].to_i
   female_quantity = params[:female_quantity].to_i
   weaningday = Time.now.strftime("%Y-%m-%d")
   male_basket_id = params[:male_basket_id].to_i
   female_basket_id = params[:female_basket_id].to_i
   breed_id = params[:breed_id].to_i
   strain_id = params[:strain_id].to_i
   batch_id = params[:batch_id].to_i
   gender = params[:gender]
   @breed = Breed.find(breed_id)
   @batches = @breed.batches
   @batch = Batch.find(batch_id)
   male_quantity.times do |i|
     mouse = Mouse.create(basket_id: male_basket_id,strain_id: strain_id, birthday: @batch.childbirthday, weaningday: weaningday, gender: "M", father_id: @breed.father_id, mother_id: @breed.mother_id ,batch_id: batch_id)
   end
   female_quantity.times do |i|
     mouse = Mouse.create(basket_id: female_basket_id,strain_id: strain_id, birthday: @batch.childbirthday, weaningday: weaningday, gender: "F", father_id: @breed.father_id, mother_id: @breed.mother_id, batch_id: batch_id)
   end
  end

  def disable
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
    @breed_info = BreedsInfo.create(breed_id: @breed.id, operation_type: "合笼", operation_by: current_user.id, operation_at: @breed.cage_at, remark: "#{@breed.father.code}[#{@breed.father.strain.name}]和#{@breed.mother.code}[#{@breed.mother.strain.name}]的小鼠在#{@breed.basket.code}合笼")
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
