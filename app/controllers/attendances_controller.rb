class AttendancesController < ApplicationController

  before_action :authenticate_user!

  def index
    @comment = Comment.all
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to root_path
      flash[:notice] = '出勤データが送信されました。今日も1日頑張りましょう！' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :new
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    attendance = Attendance.find(params[:id])
    if attendance.update(attendance_params)
      redirect_to corrects_path
      flash[:notice] = '出勤データが変更されました。' 
    else
      flash.now[:alert] = '入力に不備があります'
      render :edit
    end
  end



  private

  def attendance_params
    params.require(:attendance).permit(:attendance_day, :arrive_id, :flying_id ).merge(user_id: current_user.id)
  end

end
