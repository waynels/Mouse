#encoding: utf-8
class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy,:set_status,:finish_list]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all
  end
  def get_data
    key = params[:search][:value] if params[:search]
    column = ["todo_lists.mouse_id","todo_lists.mouse_id", "todo_lists.status", "todo_lists.operation","todo_lists.description","todo_lists.mouse_id",["todo_lists.created_at"], ["todo_lists.created_at"]]
    data = get_datatable_data(column, "TodoList",nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{todo_list_path(item)}' data-remote=true class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_todo_list_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{todo_list_path(item)}'>删除</a>"
      end
      arr << ["#{item.mouse.code}[#{item.mouse.strain.common_name}]", item.mouse.onwer.full_name, item.operation_lable, item.status_lable, item.description, item.creator.full_name,item.created_at.strftime('%Y-%m-%d'), op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
  end

  def set_status
  end

  def finish_list
    @todo_lists = TodoList.all
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.js
      end
    end
  end

  # GET /todo_lists/1/edit
  def edit
    @mouse = @todo_list.mouse
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.created_by = current_user.id
    respond_to do |format|
      if @todo_list.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.js
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params[:todo_list].permit(:mouse_id, :description, :operation, :status)
    end
end
