class ItemsController < ApplicationController
  # before_action :authenticate_user!

  #リダイレクト処理
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
  end
end
