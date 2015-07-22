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
  def download_mice
    if current_user.has_role?(:PI)
    @breeds = Breed.where("is_usable = true or breeding = true")
    else
    @breeds = current_user.breeds.where("is_usable = true or breeding = true")
    end
    respond_to do |format|  
      format.html {render :partial => "download_mice" }
      format.xls  
      headers["Content-Disposition"] = "attachment; filename=\"breeds_#{Time.now.strftime("%Y%m%d%H%M%S")}.xls\""
    end  
  end

  def get_data 
    key = params[:search][:value] if params[:search]
    column = [ "mice.code","mice.code","baskets.code","breeds.cage_at","breeds.is_usable","breeds.breeding","breeds.cancel_date",["breeds.created_at"]]
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
    gen_like_condition search_conditions, "strains.common_name", key
    condition_str = search_conditions.join(' or ')
    if current_user.has_role?(:PI)
      total = Breed.all.size
      filter_total = Breed.includes([{father: :strain}, :basket]).where(condition_str).references([{father: :strain}, :basket]).size
      @breeds = Breed.includes([{father: :strain}, :basket]).where(condition_str).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i).references([{father: :strain}, :basket])
    else
      total = current_user.breeds.size
      filter_total = current_user.breeds.includes([{father: :strain}, :basket]).where(condition_str).references([{father: :strain}, :basket]).size
      @breeds = current_user.breeds.includes([{father: :strain}, :basket]).where(condition_str).order("#{order} #{dir}").limit(params[:length].to_i).offset(params[:start].to_i).references([{father: :strain}, :basket])
    end
    arr = []
    @breeds.each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{breed_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        if item.is_usable
        op_str = op_str + " <a href='#{edit_breed_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        end
      end
      arr << [ item.father ? "#{item.father.code}[#{item.father.strain.common_name}](#{item.father.mouse_age})" : "丢失", item.mother ? "#{item.mother.code}[#{item.mother.strain.common_name}](#{item.mother.mouse_age})" : "丢失","#{Framework.all.index(item.basket.framework)+1}-#{item.basket.code}", "#{item.cage_at}(#{item.mate_age})", item.show_can_usable.html_safe, item.breeding, item.creator.try(:full_name), item.cancel_date, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => total, "recordsFiltered" => filter_total, "data"=> arr}
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
    @breed_info = BreedsInfo.create(breed_id: @breed.id, operation_type: "分笼", operation_by: current_user.id, operation_at: @breed.cage_at,batch_id: @batch.id, remark: "#{@breed.father.code}[#{@breed.father.strain.name}]和#{@breed.mother.code}的小鼠在#{weaningday}分笼")
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
    @basket = Basket.find(params[:basket_id])
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
    unless @breed.basket_id == @breed.father.basket_id
      @mouse = @breed.father
      @operation = Operation.create(strain_id: @mouse.strain_id, mouse_id: @mouse.id, operation_type: "移动位置", old_basket: @mouse.basket_id, new_basket: @breed.basket_id, operation_by: current_user.id, operation_at: @breed.cage_at, remark: "编号为#{@mouse.code}的老鼠在#{@breed.cage_at}因为合笼位置从#{@music.basket_id}移动的#{@breed.basket_id}")
      @mouse.basket_id = @breed.basket_id
      @mouse.save
    end
    unless @breed.basket_id == @breed.mother.basket_id
      @mouse = @breed.mother
      @operation = Operation.create(strain_id: @mouse.strain_id, mouse_id: @mouse.id, operation_type: "移动位置", old_basket: @mouse.basket_id, new_basket: @breed.basket_id, operation_by: current_user.id, operation_at: @breed.cage_at, remark: "编号为#{@mouse.code}的老鼠在#{@breed.cage_at}因为合笼位置从#{@music.basket_id}移动的#{@breed.basket_id}")
      @mouse.basket_id = @breed.basket_id
      @mouse.save
    end
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
        format.js
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
      params[:breed].permit(:father_id, :mother_id, :basket_id, :cage_at, :is_usable, :cancel_date, :breeding)
    end
    def breed_info_params
      params[:breed_info].permit(:breed_id, :batch_id,  :operation_type, :operation_by, :operation_at, :quantity, :remark, :die_reason)
    end
    def operation_params
      params[:operation].permit(:strain_id, :operation_by, :mouse_id,:operation_type, :operation_at, :old_basket, :new_basket, :remark)
    end
    def mouse_params
      params[:mouse].permit(:basket_id, :strain_id, :generate_num, :birthday, :weaningday, :gender, :code, :identification, :gfp, :gfp_val, :father_code, :mother_code, :batch_id)
    end
end
