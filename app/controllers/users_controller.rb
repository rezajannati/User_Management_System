class UsersController < ApplicationController

  def index
  	@show_users = User.all
  end


  def show
    @show_user = User.find(params[:id])
  end
  
  
  def new
  	@user = User.new
  end

  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Succesfully added user!"
  		redirect_to("/")
  	else
  		render("users/new")
  	end
  end
  
  
  def edit
    @user_info = User.find(params[:id])
  end

  def update
    u = User.find(params[:id])
    u.update_attributes(:first_name => params[:user][:first_name],:last_name => params[:user][:last_name], :email => params[:user][:email], :password => params[:user][:password])
    redirect_to("/")
  end


  def destroy
    @del_user = User.find(params[:id])
    @del_user.destroy
    redirect_to("/")
  end

  private 
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
