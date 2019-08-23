class UsersController < ApplicationController
  def new 
    @user =  User.new
    @departments = Department.all
  end

  def create
    # @department = Department.find(user_params[:department])
    # user_params[:department] = @department
    puts user_params
    @user = User.new(user_params)

    if @user.save
      NotifierMailer.with(user: @user).welcome.deliver_later
      redirect_to "/"
    else
      puts @user.errors.full_messages
      render 'new'
    end
  end

def show
  @user = User.find(params[:id])
end

def index
  @users = User.all
end



  private
    def user_params
      params.require(:user).permit(:name, :email, :url, :department_id)
    end
end
