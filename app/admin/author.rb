ActiveAdmin.register Author do

  
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
  # endhas_many :books
  active_admin_importable
 
  sidebar 'Books by this Author', :only => :show do
    table_for Book.joins(:author).where(:author_id => author.id) do |t|
      t.column("Title") { |book| book.name }
    end
  end
  csv do
  column :first_name
  column :last_name

  xlsx(:header_style => {:bg_color => 'C0BFBF', :fg_color => '000000' }) do
  delete_columns :id, :created_at, :updated_at

  index download_links: [:csv, :xlsx]
end
end
end
