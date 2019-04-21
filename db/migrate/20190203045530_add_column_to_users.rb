class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :bio, :text
  	add_column :users, :display_name,  :string
  	add_column :users, :website_url,   :string
  	add_column :users, :facebook_url,  :string
  	add_column :users, :twitter_url, :string
  	add_column :users, :flicker_url, :string
  end
end
