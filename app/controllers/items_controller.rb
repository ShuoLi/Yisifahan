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
		@category = params[:cpath]
	elsif (params.has_key?(:uncategorized))
		@items = Item.uncategorized()
	elsif (params.has_key?(:ascend))
		if (params.has_key?(:cat))
			@items = Item.sortbyprice(params[:ascend], params[:cat])
			@category = params[:cat]
		else
			@items = Item.sortbyprice(params[:ascend], nil)
		end
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
    @similar = Item.find(:all, :conditions=>["category_id IS ? AND id IS NOT ?", @item.category_id, @item.id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end
end
