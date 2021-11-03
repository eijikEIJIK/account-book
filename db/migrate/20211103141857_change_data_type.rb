class ChangeDataType < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :income_or_payment, :string
    change_column :accounts, :memo, :text
  end
end
