class AddShortToConsoles < ActiveRecord::Migration[6.1]
  def change
    add_column :consoles, :short, :string
  end
end
