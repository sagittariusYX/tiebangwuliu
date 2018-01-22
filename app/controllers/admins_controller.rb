class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      admin = Admin.find(1)
      @users = Organization.find(admin.organization_id).users
    else
      redirect_to login_path
    end
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def login
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.organization_id = 1

    respond_to do |format|
      if @admin.save
        log_in @admin
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render action: 'index', status: :created, location: @admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

  # def show_users
  #   @admin = Admin.find(1)
  #   @users = Organization.find(@admin.organization_id).users
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
