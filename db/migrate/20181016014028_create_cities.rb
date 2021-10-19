class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :codigo
      t.string :nome
      t.string :uf

      t.timestamps
    end
  end
end
