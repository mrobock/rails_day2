class CheckPasswordController < ApplicationController

  def check
    unless params[:user] == "" || params[:user] == nil || params[:pass] == "" || params[:pass] == nil
      @user = params[:user]
      @pass = params[:pass]
      if @user.length < 6
        flash.now[:alert] = "Your username is too short!"
      elsif @user == "username"
        flash.now[:alert] = "Your username can't be \"username\"!"
      elsif @user.include?("$") || @user.include?("!") || @user.include?("#")
        flash.now[:alert] = "Your username can't have a symbol ($!#), Toma!"
      else
        flash.now[:alert] = "Great job Toma!"
      end

      if @pass.length < 6
        flash.now[:stupidface] = "Your pass is too short!"
      elsif @pass == "password"
        flash.now[:stupidface] = "Your password can't be \"password\"!"
      elsif !@pass.include?("$") && !@pass.include?("!") && !@pass.include?("#")
        flash.now[:stupidface] = "Your password MUST have a symbol ($!#), Toma!"
      else
        flash.now[:stupidface] = "Great job Toma!"
      end
    end
  end

end
