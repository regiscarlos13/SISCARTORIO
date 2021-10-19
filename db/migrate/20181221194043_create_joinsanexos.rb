class CreateJoinsanexos < ActiveRecord::Migration[5.2]
  def change
    create_table :joinsanexos do |t|
      t.references :join, foreign_key: true
      t.string :documento

      t.timestamps
    end
  end
end
