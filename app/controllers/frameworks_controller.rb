class FrameworksController < ApplicationController
  before_action :set_framework, only: [:show, :edit, :update, :destroy, :set_roles, :save_roles]

  def index
    @frameworks = Framework.all
  end

  def show
  end
  private
  def set_framework
    @framework = Framework.find(params[:id])
  end
end
