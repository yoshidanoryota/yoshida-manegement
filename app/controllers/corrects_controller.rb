class CorrectsController < ApplicationController

  def index
    user = current_user
    @attendances = user.attendances
    @outs = user.outs
  end

end
