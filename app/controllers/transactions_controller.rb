class TransactionsController < ApplicationController
  before_action :check_profile_is_complete

  def create
    current_user.transactions.create(params_for(Transaction))
    redirect_to transactions_path
  end

  def update
    current_user.transactions.find(params[:id]).update(params_for(Transaction))
    redirect_to transactions_path
  end

  def destroy
    current_user.transactions.find(params[:id]).destroy
    redirect_to transactions_path
  end

  private

  def check_profile_is_complete
    redirect_to profile_path unless current_user.profile_complete?
  end
end
