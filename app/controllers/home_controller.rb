class HomeController < ApplicationController
  
  def index
    @slides = Slide.find(:all)
	@items = Item.where(:popular=>true)
	  
	if params.has_key?(:slide_id)
	  	@current = Slide.where(:id=>params[:slide_id]).first
  	else
	  	@current = @slides[0]
  	end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  def service
    @services = Service.find(:all)
  end
  
  def aboutUs
    @abouts = About.find(:all)
  end
end