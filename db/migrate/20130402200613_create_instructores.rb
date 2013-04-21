class CreateInstructores < ActiveRecord::Migration
  def change
    create_table :instructores do |t|
      t.string :cedula
      t.string :nombres
      t.string :email
      t.string :direccion
      t.string :telefono
      t.date :fch_ncto
      t.string :modalidad

      t.timestamps
    end
  end
end
