class CreateDeviseOmniauthAuthentications < ActiveRecord::Migration
  def change
    create_table :devise_omniauth_authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :provider_id
      t.timestamps
    end

    add_index :devise_omniauth_authentications, :user_id, :name => 'devise_omniauth_authentications_on_user_id'
    add_index :devise_omniauth_authentications, [:provider, :provider_id], :name => 'devise_omniauth_authentications_on_provider_and_provider_id'
  end
end
