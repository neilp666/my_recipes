class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_chef, :logged_in?

  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
    !!current_chef
  end

  def require_user
    if !logged_in? #if not logged in
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def require_some_user
    if current_chef != @recipe.chef_id
      flash[:danger] = "You can only edit or delete your own recipes"
      redirect_to recipes_path
    end
  end
end
