class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.string :number
      t.string :size
      t.string :price

      t.timestamps
    end
  end
end
