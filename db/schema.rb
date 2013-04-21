# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130418132553) do

  create_table "cursos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "ficha",      :limit => nil
  end

  create_table "estudiantes", :force => true do |t|
    t.string   "nombre"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.date     "fch_nacimineto"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "curso_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "horarios", :force => true do |t|
    t.date     "dia"
    t.time     "hora"
    t.string   "aula"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "instructor_id"
    t.integer  "materia_id"
    t.integer  "curso_id"
  end

  create_table "instructores", :force => true do |t|
    t.string   "cedula"
    t.string   "nombres"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.date     "fch_ncto"
    t.string   "modalidad"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "materias", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
