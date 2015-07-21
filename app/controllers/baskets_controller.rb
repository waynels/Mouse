class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index
    @frameworks = Framework.all
    @todo_lists = TodoList.all
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end

  def show_mouse
    @mouse = Mouse.find(params[:mouse_id])
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
    xy = params[:f_w_type].split("*")
    x = xy[0].to_i
    y = xy[1].to_i
    @framework = Framework.create( axis_x: x, axis_y:y)
    x.times do |i|
      y.times do |j|
        basket = Basket.create(code: "#{i+1}#{(j+65).chr}",framework_id: @framework.id)
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

  def breeding_littler_mice 
    @basket = Basket.find(params[:id])
    @f_m = Mouse.find(params[:mouse_id])
    @breed = Breed.where(mother_id: @f_m.id).last
    @m_m = @breed.father
    respond_to do |format|
      format.js
    end
  end

  def create_littler_mice 
    @breed = Breed.find(params[:breed_id])
    @basket = Basket.find(params[:id])
    @framework = @basket.framework
    strain_id = params[:strain_id].to_i
    quantity = params[:quantity].to_i
    @batch = Batch.create(father_id: @breed.father_id, mother_id: @breed.mother_id, breed_id: @breed.id,quantity: quantity, childbirthday: params[:childbirthday],basket_id: @basket)
    quantity.times do |i|
      mouse = Mouse.create(basket_id: @basket.id,strain_id: strain_id, birthday: @batch.childbirthday,father_id: @breed.father_id, mother_id: @breed.mother_id ,batch_id: @batch_id, onwer_id: current_user.id, created_by: current_user.id,batch_id: @batch.id )
    end
    if quantity > 0
      @breed.breeding = true
      @breed.save
    end
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
  end

  def change_basket 
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
    @mouse.basket_id = params[:mouse][:basket_id]
    @mouse.save
    @mouses=@basket.mice.alive_mice
  end

  def edit_mouse 
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
  end

  def update_mouse
    @basket = Basket.find(params[:id])
    @framework = @basket.framework
    @mouse = Mouse.find(params[:mouse_id])
    @mouse.update(mouse_params)
    arr = []
    @mouse.strain.genes.each do |gene|
      arr << params["gene_allele_#{gene.id}"]
    end
    p arr
    @mouse.allele_ids = arr.uniq
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
  end


  def share_mouse  
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
  end
  def set_share  
    @basket = Basket.find(params[:id])
    @framework = @basket.framework
    @mouse = Mouse.find(params[:mouse_id])
    @mouse.update(mouse_params)
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
  end

  def mouse_dead
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
  end

  def dead_record 
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
    params[:mouse][:basket_id] = nil
    @mouse.update(mouse_params)
    if @basket.cage_type == "M" 
      if @mouse.sex == "M"
        breed = Breed.where(basket_id: @basket.id, father_id: @mouse.id, is_usable: true).last
        if breed
          breed.is_usable = false
          breed.cancel_date = Date.today()
          breed.save
        end
      elsif @mouse.sex == "F"
        breed = Breed.where(basket_id: @basket.id, mother_id: @mouse.id, is_usable: true).last
        if breed
          breed.is_usable = false
          breed.cancel_date = Date.today()
          breed.save
        end
      end
    end
    @framework = @basket.framework
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    respond_to do |format|
      format.js
    end
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
    @m_m = @basket.mice.alive_mice.where(gender: "M").first
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
    if current_user.has_role?(:PI)
      @mice = Mouse.where(basket_id: nil,life_status: "A")
    else
      @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end

  def breed_cage
    @basket = Basket.find(params[:id])
    @mouse = Mouse.find(params[:mouse_id])
    if @mouse.sex == "M"
      breeds = Breed.where(basket_id: @basket.id, father_id: @mouse.id, is_usable: true)
      breeds.each do |b|
        b.cage_at = params[:breed_cage_at]
        b.save
      end
    else @mouse.sex == "F"
      breed = Breed.where(basket_id: @basket.id, mother_id: @mouse.id, is_usable: true).last
      breed.cage_at = params[:breed_cage_at]
      breed.save
    end
    @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  #
  def edit
    @operation_type = params[:operation_type]
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
    old_type = @basket.cage_type
    respond_to do |format|
      @operation_type = params[:operation_type]
      if @basket.update(basket_params)
        if @operation_type == "set_onwer"
          if params[:other_basket_id] == nil or params[:other_basket_id] == ""
            if @basket.mice.alive_mice
              @basket.mice.alive_mice.each do |m|
                m.onwer_id = @basket.onwer_id
                m.save
              end
            end
            if @basket.breeds.can_use_mate.size > 0
              @basket.breeds.can_use_mate.each do |br|
                br.created_by = @basket.onwer_id
                br.save
              end
            end
          else
            p "bbbbbbbbbb"
            p @basket.onwer_id
            other_basket = Basket.find(params[:other_basket_id])
            other_basket.onwer_id = @basket.onwer_id
            other_basket.cage_type = @basket.cage_type
            other_basket.save
            if @basket.mice.alive_mice
              @basket.mice.alive_mice.each do |m|
                m.onwer_id = @basket.onwer_id
                m.basket_id = other_basket.id
                m.save
              end
            end
            if @basket.breeds.can_use_mate.size > 0
              @basket.breeds.can_use_mate.each do |br|
                br.created_by = @basket.onwer_id
                br.basket_id = other_basket.id
                br.save
              end
            end
             #小鼠有配对的配对的位置尚未改变 
            @basket.onwer_id = nil
            @basket.cage_type == "S"
            @basket.save
          end
        else
          p "dddddddddd"
          if @basket.cage_type == "M"
            unless @basket.cage_type == old_type
              breed_cage_at  = params[:breed_cage_at]
              male = @basket.mice.alive_mice.male_mice.first
              females = @basket.mice.alive_mice.female_mice
              if male
              females.each do |f|
                breed = Breed.create(basket_id: @basket.id,father_id: male.id, mother_id: f.id,cage_at: breed_cage_at, is_usable: true, created_by: current_user.id)
              end
              end
            end
          else
            if  old_type == "M"
              @basket.breeds.each do |breed|
                if bread.is_usable == true
                  breed.is_usable = false
                  bread.save
                end
              end
            end
          end
        end
        @framework = @basket.framework
        @mice = Mouse.where(onwer_id: current_user.id, basket_id: nil,life_status: "A")
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
  def framework_params
    params[:framework].permit(:code, :axis_y, :axis_x)
  end
  def mouse_params
    params[:mouse].permit(:basket_id, :strain_id, :generation, :birthday, :wean_date, :sex, :code, :life_status, :coat_color, :dead_date, :mother_id, :father_id, :batch_id,:dead_date , :dead , :onwer_id , :created_by, :is_dead, :description)
  end
end
