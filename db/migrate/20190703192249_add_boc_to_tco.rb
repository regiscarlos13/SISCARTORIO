class AddBocToTco < ActiveRecord::Migration[5.2]
  def change
    add_reference :tcos, :boc, foreign_key: true
  end
end
