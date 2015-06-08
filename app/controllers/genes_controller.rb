#encoding: utf-8
class GenesController < ApplicationController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]

  # GET /genes
  # GET /genes.json
  def index
    @genes = Gene.all
  end

  def get_data
    key = params[:search][:value] if params[:search]
    column = ["genes.name", "genes.short_name", "genes.access_id","genes.location", ["genes.created_at"]]
    data = get_datatable_data(column, "Gene",nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{gene_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_gene_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{gene_path(item)}'>删除</a>"
      end
      arr << [item.name, item.short_name, item.access_id, item.location, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end


  # GET /genes/1
  # GET /genes/1.json
  def show
  end

  # GET /genes/new
  def new
    @gene = Gene.new
  end

  # GET /genes/1/edit
  def edit
  end

  # POST /genes
  # POST /genes.json
  def create
    @gene = Gene.new(gene_params)

    respond_to do |format|
      if @gene.save
        arr = params[:allele_tags].split(",")
        arr.size.times.each do |i|
          allele = Allele.create(gene_id: @gene.id, name: arr[i])
        end
        format.js
      else
        format.html { render :new }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genes/1
  # PATCH/PUT /genes/1.json
  def update
    respond_to do |format|
      if @gene.update(gene_params)
        old_arr = @gene.alleles.map{|al| al.name}
        new_arr = params[:allele_tags].split(",")
        and_arr = old_arr & new_arr
        p and_arr
        remove_arr = old_arr - and_arr
        p remove_arr 
        remove_arr.size.times.each do |i|
          allele = Allele.where(gene_id: @gene.id, name: remove_arr[i]).first
          allele.destroy
        end
        add_arr = new_arr - and_arr
        p add_arr
        add_arr.size.times.each do |i|
          allele = Allele.create(gene_id: @gene.id, name: add_arr[i])
        end
        format.js
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to genes_url, notice: 'Gene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gene
      @gene = Gene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gene_params
      params[:gene].permit(:name, :short_name, :access_id, :location)
    end
end
