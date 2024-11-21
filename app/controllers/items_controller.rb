class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user)

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end


  # 削除機能
  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path

    end
  end

  private

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition_id,
      :shopping_cost_id,
      :shopping_region_id,
      :shopping_day_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index

    return if current_user.id == @item.user_id

    redirect_to root_path


  end
end
