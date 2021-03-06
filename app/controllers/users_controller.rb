class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      zip_code: params[:zip_code],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created account!'
      redirect_to "/users/#{@user.id}"
    else
      render '/users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
