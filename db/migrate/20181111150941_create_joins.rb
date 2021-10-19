class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.date :date
      t.references :inquery, foreign_key: true
      t.references :registry, foreign_key: true
      t.references :server, foreign_key: true
      t.string :folha
      

      t.timestamps
    end
  end
end
