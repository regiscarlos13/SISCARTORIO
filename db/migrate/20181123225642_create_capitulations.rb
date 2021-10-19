class CreateCapitulations < ActiveRecord::Migration[5.2]
  def change
    create_table :capitulations do |t|
      t.string :article
      t.string :paragraph
      t.string :subsection
      t.string :lines
      t.references :inquery, foreign_key: true
      t.references :law, foreign_key: true


      t.timestamps
    end
  end
end
