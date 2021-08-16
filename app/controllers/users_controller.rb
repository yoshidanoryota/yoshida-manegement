class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :create
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :number, :division_id, :office_id)
  end
end
