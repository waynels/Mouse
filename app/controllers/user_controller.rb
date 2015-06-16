#encoding: utf-8
class UserController < ApplicationController
  authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy, :set_roles, :save_roles]

  respond_to :html

  def index
    if params[:user]
      if params[:user][:username]
        @user=User.find_by_username(params[:user][:username])
        if @user
          json="false"
        else
          json="true"
        end
      end
      if params[:user][:email]
        @user=User.find_by_email(params[:user][:email])
        if @user
          json="false"
        else
          json="true"
        end
      end

      respond_to do |format|
        format.js {render :text=>json}
      end
    end
  end
  def get_data
    key = params[:search][:value] if params[:search]
    column = ["users.username", "users.email", ["users.created_at"]]
    data = get_datatable_data(column, "User",nil)
    arr = []
    data[0].each do |item|
      op_str = ""
      if can? :read, item 
        op_str = op_str + "<a href='#{user_path(item)}' class='btn btn-mini'>查看</a>"
      end 
      if can? :manage, item 
        op_str = op_str + " <a href='#{edit_user_path(item)}' data-remote=true class='btn btn-mini'>编辑</a>"
        op_str = op_str + " <a class='btn btn-mini btn-danger' data-remote=true rel='nofollow' data-method='delete' data-confirm='真要删除吗？' href='#{user_path(item)}'>删除</a>"
        op_str = op_str + " <a href='#{set_roles_user_path(item)}' data-remote=true class='btn btn-mini'>设置角色</a>"
      end
      arr << [item.username, item.email, op_str]
    end
    json = {"draw" => 0, "recordsTotal" => data[1], "recordsFiltered" => data[2], "data"=> arr}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json }
    end
  end

  def show
    respond_with(@user)
    authorize! :read, @user
  end

  def new
    @user = User.new
    authorize! :read, @user
  end

  def edit
    authorize! :read, @user
    p @user
  end

  def create
    @user = User.new(user_params)
    authorize! :read, @user
    @user.confirmed_at = DateTime.now()
    @user.confirmation_sent_at = DateTime.now()
    @user.save
    @user.add_role :Manager
  end

  def update
    authorize! :read, @user
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end
  def set_roles
  end
  def save_roles
    @user.roles = [] 
    @user.add_role(params[:role])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:confirmation_sent_at, :confirmed_at, :full_name, :username, :email, :password, :password_confirmation, :remember_me)
  end
end
