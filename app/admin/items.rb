ActiveAdmin.register Item do
	controller do 
		def new
			@item = Item.new
		end
	end

	form :partial => "admin/image_upload_form"
end
