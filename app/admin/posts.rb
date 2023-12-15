ActiveAdmin.register Post do

 
  permit_params :title, :body, :published_at, :user, :refernece, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :published_at
      f.input :user
      f.input :image, as: :file
    end
    f.actions
  end
end