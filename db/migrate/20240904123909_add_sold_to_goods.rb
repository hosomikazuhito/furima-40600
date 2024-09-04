class AddSoldToGoods < ActiveRecord::Migration[7.0]
  def change
    add_column :goods, :sold, :boolean, default: false
  end
end
