class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.integer :dp
      t.boolean :active

      t.timestamps
    end
  end
end
