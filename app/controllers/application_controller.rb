class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # DeviseヘルパーメソッドをViewで使用するための記述
  helper_method :current_user, :user_signed_in?, :user_session
end

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
end
