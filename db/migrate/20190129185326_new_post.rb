class NewPost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.string :name
  		t.string :description
  		t.integer :category_id
  		t.integer :user_id
  		t.timestamp
  	end
  end
end
