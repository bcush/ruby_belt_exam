class TransactionsController < ApplicationController
  def login
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

  def lender_show
    @current_lender = Lender.find(session[:lender_id])
    @borrowers = Borrower.all
    @lendees = Transaction.joins(:borrower).select('*').where(lender:Lender.find(params[:id]))
  end

  def lend_money
    @current_lender = Lender.find(session[:lender_id])
    @current_lender.update(money:@current_lender.money-params[:lend_amount].to_i)
    @current_borrower = Borrower.find(params[:current_borrower])
    if @current_borrower.raised.nil?
      @current_borrower.update(raised:params[:lend_amount].to_i)
    else
      @current_borrower.update(raised:@current_borrower.raised + params[:lend_amount].to_i)
    end

    @transaction = Transaction.create(amount: params[:lend_amount].to_i, lender:@current_lender, borrower:@current_borrower)
    redirect_to :back
  end

  def borrower_show
    @current_borrower = Borrower.find(params[:id])
    @lenders = Transaction.joins(:lender).select('*').where(borrower:Borrower.find(params[:id]))
  end

end
