class UsersController < ApplicationController

  before_action :authenticate_user!

  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :create
    end
  end

  
  def show


    search_year = 'Time.current.year-01-01'
    search_month = Time.current.all_month
    
    @rest_year = Rest.where(rest_day: search_year.in_time_zone.all_year, user_id:current_user.id).count
    @rest_month = Rest.where(rest_day: search_month, user_id:current_user.id).count

    #月 早出時間
    flying_month_array = []
    flying_month = Attendance.where(attendance_day: search_month, user_id:current_user.id)
    flying_month.each do |flying|
      flying_month_array << flying.flying_id
    end
    @flying_month = flying_month_array.sum

    #月 残業時間
    extra_month_array = []
    extra_month = Out.where(out_day: search_month, user_id:current_user.id)
    extra_month.each do |extra|
      extra_month_array << extra.extra_id
    end
    @extra_month = extra_month_array.sum

    #月 早出時間 + 残業時間
    @fll_time_month = @flying_month + @extra_month


    #年 早出時間
    flying_year_array = []
    flying_year = Attendance.where(attendance_day: search_year.in_time_zone.all_year, user_id:current_user.id)
    flying_year.each do |flying|
      flying_year_array << flying.flying_id
    end
    @flying_year = flying_year_array.sum

    #年 残業時間
    extra_year_array = []
    extra_year = Out.where(out_day: search_year.in_time_zone.all_year, user_id:current_user.id)
    extra_year.each do |extra|
      extra_year_array << extra.extra_id
    end
    @extra_year = extra_year_array.sum

    #年 早出時間 + 残業時間
    @fll_time_year = @flying_year + @extra_year



  end

  private 

  def user_params
    params.require(:user).permit(:name, :number, :division_id, :office_id)
  end
end
