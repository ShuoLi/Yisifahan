class MessagesController < InheritedResources::Base
 

  def new
    @message = Message.new
    render :layout => false
  end
  
  def create
     @message = Message.create(params[:message])
     flash[:notice] = "message sent"
     redirect_to ''
   end
end
