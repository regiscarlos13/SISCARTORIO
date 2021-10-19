class CreateBos < ActiveRecord::Migration[5.2]
  def change
    create_table :bos do |t|
      t.string :n
      t.date :ocorrencia
      t.date :fato
      t.integer :providenca

      t.references :nature, foreign_key: true
      t.references :city, foreign_key: true
      t.references :registry, foreign_key: true

      t.timestamps
    end
  end
end
