module ApplicationHelper
  def current_user
    @current_user ||= session[:user_id] && User.where(id: session[:user_id]).first
  end

  def current_transaction
    @current_transaction ||= current_user.transactions.where(id: params[:id]).first
  end

  def params_for(model)
    params.require(model.name.underscore).permit(model.column_names.reject{|column|column=~/_id$/})
  end

  def logo
    render 'layouts/logo'
  end
end
