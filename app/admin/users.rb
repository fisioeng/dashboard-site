ActiveAdmin.register User do
  permit_params :email, :name

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at
  show do
    attributes_table do
      row :email
      row :name
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
    end
    f.actions
  end

end
