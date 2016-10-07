class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :vote_yes
      t.integer :vote_no

      t.timestamps null: false
    end
  end
end
