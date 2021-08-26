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
      flash[:notice] = '入力に不備があります'
      render :new
    end
  end

  def index
    user = current_user
    @rests = user.rests.order(rest_day: "DESC")
  end

  def edit
    @rest = Rest.find(params[:id])
  end

  def update
    rest = Rest.find(params[:id])
    if rest.update(rest_params)
      redirect_to rests_path
      flash[:notice] = '休暇データが変更されました。' 
    else
      flash[:notice] = '入力に不備があります'
      render :edit
    end
  end

  def destroy
    @rest = Rest.find(params[:id])
    if @rest.destroy
      redirect_to rests_path
      flash[:notice] = '休暇データが削除されました。' 
    end
  end



  private

  def rest_params
    params.require(:rest).permit(:rest_day, :holiday_id ).merge(user_id: current_user.id)
  end


end
