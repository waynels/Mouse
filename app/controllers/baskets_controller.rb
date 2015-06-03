class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index
    if params[:box_num]
      @baskets = Basket.limit(100).offset(params[:box_num].to_i * 100)
    else
      @baskets = Basket.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end
  
  def cage_setting
    @frameworks = Framework.all
  end

  def show_basket 
    @framework = Framework.find(params[:f_w])
  end

  def set_cage_type 
      @basket = Basket.find(params[:id])
  end

  def new_framework
    @framework = Framework.create(code: "mouse#{params[:f_w_type]}")
    if params[:f_w_type] == "10*10"
      10.times do |i|
        10.times do |j|
          basket = Basket.create(code: "#{@framework.id}-#{i+1}#{(j+65).chr}",framework_id: @framework.id)
        end
      end
    elsif params[:f_w_type] == "5*5"
      10.times do |i|
        10.times do |j|
          basket = Basket.create(code: "#{@framework.id}-#{i+1}#{(j+65).chr}",framework_id: @framework.id)
        end
      end
    end
    @frameworks = Framework.all
  end

  def add_mouse
    @basket = Basket.find(params[:id])
  end
  def remove_mouse
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])

  end

  def create_littler_mice 
    @breed = Breed.find(params[:breed_id])
    @basket = Basket.find(params[:id])
    strain_id = params[:strain_id].to_i
    quantity = params[:quantity].to_i
    @batch = Batch.create(father_id: @breed.father_id, mother_id: @breed.mother_id, breed_id: @breed.id,quantity: quantity, childbirthday: params[:childbirthday],basket_id: @basket)
    quantity.times do |i|
     mouse = Mouse.create(basket_id: @basket.id,strain_id: strain_id, birthday: @batch.childbirthday,father_id: @breed.father_id, mother_id: @breed.mother_id ,batch_id: @batch_id)
    end
  end

  def change_basket 
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
    @mouse.basket_id = params[:mouse][:basket_id]
    @mouse.save
    @mouses=@basket.mice

  end

  def get_other_basket 
    @basket = Basket.find(params[:id])
  end

  def find_new_basket 
    @old_basket = Basket.find(params[:id])
    @another_basket = Basket.find(params[:new_basket_id])
  end

  def save_mouse
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
    @m_old_basket = @mouse.basket
    exchange_mouses(@basket, @mouse, @m_old_basket)   
  end

  def breed_mouse 
    @basket = Basket.find(params[:id])
    @f_m = Mouse.find(params[:mouse_id])
    @m_m = @basket.mice.where(gender: "M").first
    @breed = Breed.where(basket_id: @basket.id, mother_id: @f_m.id, father_id: @m_m.id, is_usable: true).first
  end

  def autocomplete 
    respond_to do |format|
      ar = Basket.all.collect{|m| {:id => m.id, :value => m.code, :label => "#{m.code}"} }
      format.json {render :json=>ar}
    end
  end
  # GET /baskets/1
  # GET /baskets/1.json
  def show
    @basket = Basket.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)

    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        @framework = @basket.framework
        format.js
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params[:basket].permit(:code, :cage_type, :framework_id, :onwer_id)
    end
end
