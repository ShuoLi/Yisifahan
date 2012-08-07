class MessagesController < InheritedResources::Base
 

  def new
    @message = Message.new
    render :layout => false
  end
  
  def create
     @message = Message.create(params[:message])
     redirect_to ''
     flash[:notice] = "message sent"
   end
end
