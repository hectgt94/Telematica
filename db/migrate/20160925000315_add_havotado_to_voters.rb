class AddHavotadoToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :havotado, :string
  end
end
