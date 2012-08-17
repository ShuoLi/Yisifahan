 class ItemsController < ApplicationController

  # GET /items
  # GET /items.json
  def index
  	parameters = {}  	
  	if (params.has_key?(:ascend))
  		parameters["ascend"] = params[:ascend]
	end
  	if (params.has_key?(:search_text))
  		parameters["search_text"] = params[:search_text]
  	end
  	if (params.has_key?(:low))
  		parameters["low"] = params[:low]
  	end
  	if (params.has_key?(:high))
  	    parameters["high"] = params[:high]
  	end
  	if (params.has_key?(:cpath))
  		parameters["cpath"] = params[:cpath]
	end
	
	@items = Item.findItems(parameters)

  	perpage = 10
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

  # render message to send wishlist
  def send_wishlist
    if cookies['wishlist']
      wishlist_ids = cookies['wishlist'].split(',')
      wishlist = []
      wishlist_ids.each do |id|
        wishlist << Item.find(id)
      end
      if !wishlist.empty?
        @msg = "I am interested in these items:\r\n"
        wishlist.each do |item|
          @msg += item.name + ", item code: #" + item.item_code.to_s + ";\r\n"
        end
      end
      # puts @msg
      render "send_wishlist.js.erb"
    else
      render :nothing => true
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @images = @item.images.find(:all)
    if (params.has_key?(:img_id))
    	@current = Image.find(params[:img_id])
    elsif @images != []
    	@current = @images[0]
    else
    	@current = nil
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def create
	  @item = Item.new(params[:item])
		if @item.save
			image = params[:item][:images_attributes]['0']
			if image
				@image = @item.images.new(image)
				@image.save
			end
			redirect_to '/admin/items/'+@item.id.to_s
		else
			render :nothing => true
		end
  end
end
