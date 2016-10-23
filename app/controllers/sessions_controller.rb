class SessionsController < ApplicationController
  def new
  end

  def create
    b = Borrower.find_by_email(params[:email])
    l = Lender.find_by_email(params[:email])
    if (b && b.authenticate(params[:password]))
      session[:borrower_id] = b.id
      redirect_to '/online_lending/borrower/' + b.id.to_s
    elsif (l && l.authenticate(params[:password]))
        session[:lender_id] = l.id
        redirect_to '/online_lending/lender/' + l.id.to_s
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
