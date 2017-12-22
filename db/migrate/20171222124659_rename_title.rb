class RenameTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :titles, :title, :name 
  end
end
