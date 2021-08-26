class CorrectsController < ApplicationController

  before_action :authenticate_user!

  

  def index
    user = current_user
    @attendances = user.attendances.order(attendance_day: "DESC") .limit(20)
    @outs = user.outs
  end

end
