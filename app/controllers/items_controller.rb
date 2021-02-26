class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item,             only:[:edit,:show,:update]
  before_action :reset_item,           only:[:edit,:update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit  
  end

  def update
    if  @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :cost_id, :area_id, :days_id,
                                 :price).merge(user_id: current_user.id)
  end


  def set_item
    @item=Item.find(params[:id])
  end

  def reset_item
    unless current_user.id == @item.user_id
      redirect_to action: :index 
    end
  end

end
