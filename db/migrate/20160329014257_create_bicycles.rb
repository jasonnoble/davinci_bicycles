class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :owner
      t.string :color
      t.integer :year

      t.timestamps null: false
    end
  end
end
