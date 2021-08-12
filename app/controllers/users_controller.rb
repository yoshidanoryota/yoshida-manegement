class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "登録に成功しました"
    else
      redirect_to new_user_path, notice: "入力に不備があります"
  end

  private 

  def user_params
    params.require(:user).permit(:name, :number, :division_id, :office_id)
  end
end
