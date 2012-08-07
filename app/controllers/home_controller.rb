class HomeController < ApplicationController
  @mimi = MadMimi.new('yisifahan@gmail.com','fa4a98ed7af0adfe49e64ccdec8fca92')
  def index
    @slides = Slide.find(:all)
	  @items = Item.where(:popular=>true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  def contact

  end
  
end