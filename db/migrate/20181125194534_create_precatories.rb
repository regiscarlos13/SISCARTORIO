class CreatePrecatories < ActiveRecord::Migration[5.2]
  def change
    create_table :precatories do |t|
      t.string :n
      t.date :year
      
      t.string :name
      t.string :address
      t.string :bairro

      t.boolean :conclusion
      t.date :conclusion_date

      t.string :ipantigo

      t.references :city, foreign_key: true

      t.references :server, foreign_key: true
      t.references :registry, foreign_key: true
      t.references :inquery, foreign_key: true

      t.timestamps
    end
  end
end
