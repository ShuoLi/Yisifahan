class MessagesController < InheritedResources::Base
 

  def new
    @message = Message.new
    render :layout => false
  end
  
  def create
     @message = Message.new(params[:id])
     redirect_to ''
   end
end
