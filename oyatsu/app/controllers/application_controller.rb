class ApplicationController < ActionController::Base

  private def current_member #aplication_helperに入れるとエラーを吐くので一旦退避
    Member.find_by(id: session[:member_id]) if session[:member_id] #session(ログイン)があればメンバーオブジェクトをかえす
  end #つまりログインしているメンバーオブジェクトをかえす
  helper_method :current_member
end
