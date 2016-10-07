class AddIdmesaColumnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :idmesa, :integer
  end
end
