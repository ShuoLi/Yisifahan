class HomeController < ApplicationController
  
  def index
    @slides = Slide.find(:all)
	  @items = Item.where(:popular=>true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  def service

  end
  
end