 class ItemsController < ApplicationController

  # GET /items
  # GET /items.json
  def index
  	if (params.has_key?(:search_text))
    	@items = Item.search(params[:search_text])
    elsif (params.has_key?(:low) or params.has_key?(:high))
		@items = Item.filter(params[:low], params[:high])
	elsif (params.has_key?(:cpath))
		@items = Item.categoryfilter(params[:cpath])
	elsif (params.has_key?(:uncategorized))
		@items = Item.uncategorized()
	elsif (params.has_key?(:ascend))
		@items = Item.sortbyprice(params[:ascend])
	else
		@items = Item.find(:all)
	end
	
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