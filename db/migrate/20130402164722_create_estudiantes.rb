class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :cedula
      t.string :email
      t.string :direccion
      t.date :fch_nacimineto
      t.integer :curso_id
      
      t.timestamps
    end
  end
end
