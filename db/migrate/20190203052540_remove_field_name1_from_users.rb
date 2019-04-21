class RemoveFieldName1FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :bio, :text
  end
end
