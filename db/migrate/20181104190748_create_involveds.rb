class CreateInvolveds < ActiveRecord::Migration[5.2]
  def change
    create_table :involveds do |t|
      t.references :inquery, foreign_key: true
      t.references :person, foreign_key: true
      t.integer :typeinvolved

      t.timestamps
    end
  end
end
