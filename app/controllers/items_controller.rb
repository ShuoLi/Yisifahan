 class ItemsController < ApplicationController

  # GET /items
  # GET /items.json
  def index
	if (params.has_key?(:ascend))
		parameters = {"ascend"=>params[:ascend]}
		if (params.has_key?(:cpath))
			parameters["cpath"] = params[:cpath]
		elsif (params.has_key?(:search_text))
			parameters["search_text"] = params[:search_text]			
		elsif (params.has_key?(:low) or params.has_key?(:high))
			parameters["low"] = params[:low]
			parameters["high"] = params[:high]
		end
		@items = Item.sortbyprice(parameters)
  	elsif (params.has_key?(:search_text))
    	@items = Item.search(params[:search_text])
   	elsif (params.has_key?(:low) or params.has_key?(:high))
		@items = Item.filter(params[:low], params[:high])
	elsif (params.has_key?(:cpath))
		@items = Item.categoryfilter(params[:cpath])
	else
		@items = Item.find(:all)
	end
	
	perpage = 6
	@numpages = (@items.count/perpage)
	if (@items.count % perpage) != 0
		@numpages += 1
	end
	
	start = 0
	if (params.has_key?(:page))
		start += (params[:page].to_i-1) * perpage
	end

	@items = @items[start, start+perpage]

		
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
