class BorrowersController < ApplicationController

  def create
    if borrower_params[:password] == params[:password_conf]
      b = Borrower.new(borrower_params)
      if b.save
        flash[:message] = "Successfully created Borrower account!"
        redirect_to "/online_lending/login"
      else
        flash[:error] = "Invalid registration."
        redirect_to "/"
      end
    end
  end

  private
  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :password, :purpose, :description, :requested, :raised)
  end
end
