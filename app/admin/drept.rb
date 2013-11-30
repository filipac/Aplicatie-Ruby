ActiveAdmin.register Drept do

  form do |f|
      f.inputs "Details" do
        f.input :user_id, :label => 'Member', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
        f.input :numeDrept
        f.input :action
      end
      f.actions
    end

  controller do
    def permitted_params
      params.permit!
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
