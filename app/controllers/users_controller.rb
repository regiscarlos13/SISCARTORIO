class UsersController < ApplicationController
	before_action :variables, only: [:new, :edit]
	before_action :set_user, only: [:edit, :update, :destroy, :show]

	def index
		@users = User.all
	end

	def edit
	end

	  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to tcos_url, notice: 'Usuario Removido' }
    end
  end


	def update
		if @user.update(user_params)
			redirect_to users_path
		else
			render :edit
		end
	end


	def show
		redirect_to users_path
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	private

	def variables
		@roles = ApplicationRecord.roles.keys
	end

	def set_user
		@user = User.find(params[:id])
	end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params

    	if password_blank?
    		params.require(:user).permit(:name, :cpf, :role, :registry_id, :email).except(:password, :password_confirmation)
    	else
    		params.require(:user).permit(:name, :cpf, :role, :registry_id, :email,  :password, :password_confirmation)
    	end

    end

    def password_blank?
    	params[:user][:password].blank? &&
    	params[:user][:password_confirmation].blank?
    end




end
