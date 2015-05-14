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
    data = get_datatable_data(column, "Breed", nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{breed_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{breed_path(item)}' data-remote=true class='btn btn-mini'>详细信息</a>"
        if item.is_usable
        op_str = op_str + " <a href='#{edit_breed_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a href='#{disable_breed_path(item)}' data-remote=true class='btn btn-mini'>取消配对</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{breed_path(item)}'>删除</a>"
        end
      end
      arr << ["#{item.father.code}[#{item.father.strain.name}]", "#{item.mother.code}[#{item.mother.strain.name}]",item.basket.code, item.cage_at, item.show_can_usable.html_safe, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  def disable
   @breed = Breed.find(params[:id]) 
   @breed.is_usable = false
   p @breed
   @breed.save
  end
  # GET /breeds/1
  # GET /breeds/1.json
  def show
    @batches = @breed.batches
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
    @breed = Breed.find(params[:breed_id]) 
    @mouse = Mouse.find(params[:mouse_id])
  end
  def show_mouse 
    @breed = Breed.find(params[:breed_id]) 
    @mouse = Mouse.find(params[:mouse_id])
  end

  def edit_mouse 
    @breed = Breed.find(params[:breed_id]) 
    @mouse = Mouse.find(params[:mouse_id])
  end
  def save_appraisal_mouse
    @breed = Breed.find(params[:id])
    @batches = @breed.batches
    @mouse = Mouse.find(params[:mouse_id])
    @mouse.update(mouse_params)

    respond_to do |format|
      format.js
    end
  end

  def save_mice_cage
   male_quantity = params[:male_quantity].to_i
   female_quantity = params[:female_quantity].to_i
   weaningday = params[:weaningday] 
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

  def die_record
   @breed = Breed.find(params[:breed_id]) 
   @batch = Batch.find(params[:batch_id]) 
  end

  def save_die_record 
   @breed = Breed.find(params[:breed_info][:breed_id])
   @batches = @breed.batches
   @batch = Batch.find(params[:breed_info][:batch_id])
   @batch.use_val = @batch.use_val - params[:breed_info][:quantity].to_i
   @batch.save
   @breed_info = BreedsInfo.new(breed_info_params)
   @breed_info.operation_type = "死亡记录"
   @breed_info.remark = "批次为#{@batch.id}-#{@batch.childbirthday}的老鼠死亡#{params[:breed_info][:quantity]}只,该批次还剩余#{@batch.use_val}只小鼠"
   @breed_info.save
    respond_to do |format|
      format.js
    end
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
    def breed_info_params
      params[:breed_info].permit(:breed_id, :batch_id, :operation_type, :operation_by, :operation_at, :quantity, :remark, :die_reason)
    end
    def mouse_params
      params[:mouse].permit(:basket_id, :strain_id, :generate_num, :birthday, :weaningday, :gender, :code, :identification, :gfp, :gfp_val, :father_code, :mother_code, :batch_id)
    end
end
