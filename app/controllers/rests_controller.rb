class RestsController < ApplicationController

  before_action :authenticate_user!

  def new
    @rest = Rest.new
  end

  def create
    @rest = Rest.new(rest_params)
    if @rest.save
      redirect_to root_path
      flash[:notice] = '休暇申請が送信されました。' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :new
    end
  end



  private

  def rest_params
    params.require(:rest).permit(:rest_day, :holiday_id ).merge(user_id: current_user.id)
  end


end
