ActiveAdmin.register Category do
  index do
    column :name
    column :created_at
    column :updated_at

    # column :image do 
    #   form :html => { :multipart => true } do |f|
    # 
    #     f.inputs "Image", :for => [:category_image, f.object.category_image || Category_image.new ] do |fm|
    #       # fm.inputs "Image", :for => [:image, fm.object.image || Image.new] do |fmi|
    #       fm.input :file, :for => :category_image, :as => :file, :hint => f.template.image_tag(f.object.category_image.image.url(:cropped))
    #       # end
    #       # fm.inputs "Video", :for => [:video, fm.object.video || Video.new] do |fmv|
    #       # fmv.input :url
    #       # end
    #     end
    #   end
    # end

    default_actions
  end
end
