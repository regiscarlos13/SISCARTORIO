class CreateInqueries < ActiveRecord::Migration[5.2]
  def change
    create_table :inqueries do |t|
      t.integer :dp
      t.integer :n
      t.integer :origem
      t.integer :tipo
      t.integer :tp
      t.date :year
      t.date :establishment
      t.date :reported_date
      t.boolean :reported
      t.boolean :seizure
      t.boolean :indiciado
      t.boolean :conclusion
      t.string :documento
      
      t.references :registry, foreign_key: true
      t.references :city, foreign_key: true
      t.references :bo, foreign_key: true
     # t.references :tco, foreign_key: true
      #t.references :boc, foreign_key: true
      t.timestamps
    end
  end
end
