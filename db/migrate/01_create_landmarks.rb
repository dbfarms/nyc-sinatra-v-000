class CreateLandmarks < ActiveRecord::Migration[5.1]
  #raise "Write CreateLandmarks migration here"
  def change 
    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
    end 
  end 

end
