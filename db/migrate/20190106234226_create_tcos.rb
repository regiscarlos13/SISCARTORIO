class CreateTcos < ActiveRecord::Migration[5.2]
  def change
    create_table :tcos do |t|
      t.integer :dp
      t.integer :n
      t.date :year
      t.date :establishment
      t.references :city, foreign_key: true
      t.references :registry, foreign_key: true
      t.boolean :conclusion

      t.integer :origem
      t.integer :tipo
      t.string :documento
      t.integer :providenca
      
      t.references :inquery, foreign_key: true
      t.references :bo, foreign_key: true
      #t.references :boc, foreign_key: true

      t.timestamps
    end
  end
end
 