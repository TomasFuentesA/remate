ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :name, :Latitude, :longitude, :address, :provider, :uid
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :name, :Latitude, :longitude, :address, :provider, :uid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

 permit_params :name, :email, :password

 index do
   column :id
   column :name
   column :email
   column :created_at
   column :role
   column :email_provider do |user|
      user.email.split('0').last.capitalize
    end
    column :member_since do |user|
      time_ago_in_words(user.created_at)
    end

    actions
  end

  form do |f|
    inputs 'Agregando un nuevo usuario' do
      input :name
      input :email
      input :password
      input :role, as: :select
   end
   actions
 end

controller do
  def update
    if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
    end
  super
  end

 end

 filter :name
 filter :email, as: :select
 filter :created_at
end
