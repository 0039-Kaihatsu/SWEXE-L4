class TopController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  def main
    if session[:login_uid].nil?
      render "login"
    else
      render "main"
    end
  end
  
  def login
    if params[:uid] == "kindai" and params[:pass] == "sanriko"
      session[:login_uid] = params[:uid]
      # session[:pass] = params[:pass] 
      redirect_to action: "main"
    else
      render "error", status: 422
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to action: "main"
  end
end
