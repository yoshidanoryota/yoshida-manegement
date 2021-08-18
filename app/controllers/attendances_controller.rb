class AttendancesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(item_params)
    if @attendance.save
      redirect_to root_path
      flash[:notice] = '出勤データが送信されました。今日も1日頑張りましょう！' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :new
    end
  end



  private

  def item_params
    params.require(:attendance).permit(:attendance_day, :arrive_id, :flying_id ).merge(user_id: current_user.id)
  end

end
