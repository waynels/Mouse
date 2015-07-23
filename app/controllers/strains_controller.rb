#encoding: utf-8
class StrainsController < ApplicationController
  before_action :set_strain, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :update] 

  # GET /strains
  # GET /strains.json
  def index
    @strains = Strain.all
  end

  def genes_list 
    @genes = Gene.all 
  end

  def new_genes_tag
    @gene = Gene.new
  end

  def get_data
    key = params[:search][:value] if params[:search]
    column = ["strains.former_name", "strains.common_name", "strains.status","strains.mating_system","strains.source","strains.origin", ["strains.created_at"]]
    data = get_datatable_data(column, "Strain",nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{strain_path(item)}' data-remote=true class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_strain_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        unless item.mice.alive_mice.size > 0
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{strain_path(item)}'>删除</a>"
        end
      end
      arr << [item.former_name, item.common_name, "#{item.status_lable}(#{item.mice.alive_mice.size}只)", item.genetic_type.full_name, item.source, item.origin, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  def mice_show 
    
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
    @strain.gene_ids = params[:strain][:gene_ids]
    @strain.save
    if params[:strain][:attached]
      responds_to_parent do 
        render :js => '
        $.jGrowl("品系创建成功！", { header: "提示"});
        $(".strain_box").show()
        $(".strain_form").empty()
        $("#strain").DataTable().ajax.reload();
        '
      end  
    end
  end

  # PATCH/PUT /strains/1
  # PATCH/PUT /strains/1.json
  def update
    @strain.update(strain_params)
    @strain.gene_ids = params[:strain][:gene_ids].uniq
    @strain.save
    if params[:strain][:attached]
      responds_to_parent do 
        render :js => '
        $.jGrowl("品系更新成功！", { header: "提示"});
        $(".strain_box").show()
        $(".strain_form").empty()
        $("#strain").DataTable().ajax.reload();
        '
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
      params[:strain].permit(:former_name, :common_name, :protocol, :status, :coat_color, :wean_age, :female_mature_age,:male_mature_age, :mating_system, :breeding_consideration, :source, :origin, :ref_website, :description, :genes, :genetic_type_id, :attached)
    end
end
