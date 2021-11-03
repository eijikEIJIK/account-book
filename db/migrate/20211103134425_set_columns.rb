class SetColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :income_or_payment, :integer
    add_column :accounts, :amount, :integer
    add_column :accounts, :date, :date
    add_column :accounts, :category_1, :string
    add_column :accounts, :category_2, :string
    add_column :accounts, :memo, :string
  end
end
