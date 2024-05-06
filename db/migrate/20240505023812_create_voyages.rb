class CreateVoyages < ActiveRecord::Migration[7.0]
  def change
    create_table :voyages do |t|
      t.string :name

      t.timestamps
    end
  end
end
