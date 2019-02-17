module ApplicationHelper
  def current_user
    @current_user ||= session[:user_id] && User.where(id: session[:user_id])
  end

  def params_for(model)
    params.require(model.name.underscore).permit(model.column_names.reject{|column|column=~/_id$/})
  end
end
