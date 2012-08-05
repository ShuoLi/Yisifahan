 class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.search(params[:search_text])
	@items = Item.filter(params[:low], params[:high])
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @images = @item.images.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end
end