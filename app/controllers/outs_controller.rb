class OutsController < ApplicationController

  before_action :authenticate_user!


  def new
    @out = Out.new
  end

  def create
    @out = Out.new(out_params)
    if @out.save
      redirect_to root_path
      flash[:notice] = '退勤データが送信されました。今日も1日お疲れさまでした！' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :new
    end
  end

  def edit
    @out = Out.find(params[:id])
  end

  def update
    out = Out.find(params[:id])
    if out.update(out_params)
      redirect_to corrects_path
      flash[:notice] = '退勤データが変更されました。' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :edit
    end
  end




  private

  def out_params
    params.require(:out).permit(:out_day, :off_id, :extra_id ).merge(user_id: current_user.id)
  end




  
end
