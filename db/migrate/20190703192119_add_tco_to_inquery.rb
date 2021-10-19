class AddTcoToInquery < ActiveRecord::Migration[5.2]
  def change
    add_reference :inqueries, :tco, foreign_key: true
    add_reference :inqueries, :boc, foreign_key: true
  end
end
