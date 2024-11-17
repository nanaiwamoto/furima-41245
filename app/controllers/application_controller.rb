class ApplicationController < ActionController::Base
  #ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!

  # DeviseヘルパーメソッドをViewで使用するための記述
  helper_method :current_user, :user_signed_in?, :user_session
end


