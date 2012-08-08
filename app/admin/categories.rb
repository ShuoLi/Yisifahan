ActiveAdmin.register Category do
  index do
    column :name
    column :created_at
    column :updated_at
    
    column :image do |ca|
      div :class => "image" do
        # number_to_currency product.price
        if ca.category_image
          ca.category_image.image 
        else
          
        end
      end
    end
    default_actions
  end
end
