class RemoveFieldNameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :full_name, :string
    remove_column :users, :bio ,  :text
  end
end
