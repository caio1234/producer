class Admin::UsersController < Admin::AdminController

  menu_item :users

  def index
    @users = User.all
    respond_with @users
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    params[:user]
   # @user = User.new(params[:user])
    @user = User.new(params.require(:user).permit!)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with @user, :location => [:admin, :users]
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = 'User was successfully updated.' if @user.update_attributes(params.require(:user).permit!)
    respond_with @user, :location => [:admin, :users]
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with @user, :location => [:admin, :users]
  end

end