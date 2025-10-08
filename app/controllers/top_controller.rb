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
    uid = params[:uid]
    pw = params[:pass]

    user = User.find_by(uid: uid)

    # ユーザが存在して、入力パスワードがハッシュと一致すればログイン
    if user && BCrypt::Password.new(user.pass) == pw
      session[:login_uid] = uid
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
