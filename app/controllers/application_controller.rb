class ApplicationController < ActionController::Base
  protect_from_forgery
	##skip_before_filter :authenticate_user , :only => [:new, :create, :index]
	##before_filter :authenticate_user  



  def index
  if user_signed_in?
    redirect_to :controller=>'reviews', :action => 'index'
  end
end

end
