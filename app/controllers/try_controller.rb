class TryController < ApplicationController

  def index
    if params[:try] == nil
    cookies[:secretnum] = Random.new.rand(100)
    end
    @secretnum = cookies[:secretnum].to_i
    @try = params[:try]
    if @try != nil && @try == ""
      flash.now[:notice] = "Make a guess"
    elsif @try != nil && @try != ""
      if @try.to_i > @secretnum
        flash.now[:poop] = "Too high"
      elsif @try.to_i < @secretnum
        flash.now[:alert] = "Too low"
      else
        flash.now[:alert] = "You win!"
      end
    end
  end

end
