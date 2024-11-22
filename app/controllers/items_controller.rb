class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.includes(:user, :order).order(created_at: :desc)
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
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
    if current_user.id == @item.user_id && !@item.order.present?
    else
      redirect_to root_path
    end
  end
end