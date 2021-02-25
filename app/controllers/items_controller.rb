class ItemsController < ApplicationController

  def index
    #@items=Item.all
  end

  def new 
    @item=Item.new 
  end 
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:status_id,:cost_id,:area_id,:days_id,:price).merge(user_id:current_user.id)
  end

end
