class ApplicationController < ActionController::Base
  def index
    @items = Items.all
  end
end
