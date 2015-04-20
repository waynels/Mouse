#encoding: utf-8
class WelcomeController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @users = User.all
    respond_with(@users)
  end
  def lock_screen
    @user = current_user
    current_user = nil
    render :layout => false
  end

end
