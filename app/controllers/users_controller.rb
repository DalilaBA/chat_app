class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
# before_action :reqire_user, except: [:edit, :update, :destroy]
before_action :require_own_user, only: [:edit, :update, :destroy]


  def new
    @user = User.new
  end

  def avatar
  end

  def add_avatar
    user = current_user
    user.image_name = params[:image_name]
    if user.save
      flash[:success] ="you had an image attached"
      redirect_to user_path(current_user)
    else
      flash[:error] ="There was a problem"
      redirect_to user_path(current_user)
    end
  end

  def show
    # @user.avatar.attach(params[:avatar])
    # byebug
    # @articles = @user.articles
    # @articles = @user.articles.paginate(page: params[:page], per_page: 3)

    
  end

  def create
    # byebug
    @user = User.new(user_params)
    # @user.avatar.attach(params[:avatar])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] ="Welcom #{@user.username} to Chat with me you have successfully sign up"
      redirect_to avatar_path
    else
      flash[:error] ="The username #{@user.username} Already existe"
      redirect_to signup_path
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:success] = "Your account and all associated mesageses has been successfully deleted"
    redirect_to root_path
  end


  def edit
  end

  def update
    # @user.avatar.attach(params[:avatar])
    # byebug
    if @user.update(user_params)
      flash[:success] = "Your account information was successfuly updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :password, :image_name, :description)
  end
  
  def require_own_user
    if current_user !=@user && !current_user.admin?
      flash[:error] = "You can only edit or delete your own profile"
      redirect_to @user
    end
  end
end
