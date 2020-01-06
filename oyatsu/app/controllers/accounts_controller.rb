class AccountsController < ApplicationController
  def show
    @member = current_member #ログインしているメンバー
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attribute(params[:account])
    if @member.save
      redirect_to :account
      flash.notice = "アカウント情報を更新しました!"
    else
      render "edit"
    end
  end
end
