class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :registration
      t.integer :office
      t.boolean :active
      t.references :registry, foreign_key: true

      t.timestamps
    end
  end
end

#20181123012839