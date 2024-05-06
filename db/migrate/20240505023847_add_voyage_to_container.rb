class AddVoyageToContainer < ActiveRecord::Migration[7.0]
  def change
    add_reference :containers, :voyage, null: true, foreign_key: true
    add_column :containers, :gate, :string
  end
end
