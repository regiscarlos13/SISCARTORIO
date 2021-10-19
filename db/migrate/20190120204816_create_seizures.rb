class CreateSeizures < ActiveRecord::Migration[5.2]
  def change
    create_table :seizures do |t|
      t.string :name
      t.integer :procedimento
      t.integer :destino
      t.integer :quantidade
      t.string :doc
      t.date :data
      t.boolean :veiculo
      t.integer :tipo_veiculo
      t.string :cor
      t.string :placa
      t.string :chassi

      t.references :inquery, foreign_key: true
      t.references :boc, foreign_key: true
      t.references :bo, foreign_key: true
      t.references :tco, foreign_key: true
      t.timestamps
    end
  end
end
