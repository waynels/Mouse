#encoding: utf-8
class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
    @breed = Breed.find(params[:breed_id]) 
    p @breed
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    @breed = Breed.find(params[:batch][:breed_id]) 
    @batch.father_id = @breed.father_id
    @batch.mother_id = @breed.mother_id
    @batch.basket_id = @breed.basket_id
    p @breed.batches.size
    @batch.save
    @batches = @breed.batches
    p @batches.size
    @breed_info = BreedsInfo.create(breed_id: @breed.id, batch_id: @batch.id, operation_type: "分娩", operation_by: current_user.id, operation_at: @batch.childbirthday, remark: "#{@breed.father.code}[#{@breed.father.strain.name}]与#{@breed.mother.code}[#{@breed.mother.strain.name}]的小鼠在#{@batch.childbirthday}诞生下#{@batch.quantity}只小鼠")
    respond_to do |format|
      format.js
    end

 #   respond_to do |format|
 #     if @batch.save
 #       format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
 #       format.json { render :show, status: :created, location: @batch }
 #     else
 #       format.html { render :new }
 #       format.json { render json: @batch.errors, status: :unprocessable_entity }
 #     end
 #   end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params[:batch].permit(:father_id, :mother_id, :basket_id, :quantity, :childbirthday, :breed_id)
    end
end
