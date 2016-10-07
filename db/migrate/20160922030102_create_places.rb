class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :nombre
      t.string :direccion
      t.string :ciudad
      t.string :departamento
      t.timestamps null: false
    end
  end
end
