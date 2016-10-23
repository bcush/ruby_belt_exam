class LendersController < ApplicationController

  def create
    if lender_params[:password] == params[:password_conf]
      l = Lender.new(lender_params)
      if l.save
        flash[:message] = "Successfully created Lender account!"
        redirect_to "/online_lending/login"
      else
        flash[:error] = "Invalid lender registration."
        redirect_to "/"
      end
    end
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  end
end
