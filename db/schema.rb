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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_03_192249) do

  create_table "bocs", force: :cascade do |t|
    t.integer "dp"
    t.integer "n"
    t.date "year"
    t.date "establishment"
    t.boolean "conclusion"
    t.integer "origem"
    t.integer "tipo"
    t.string "documento"
    t.integer "providenca"
    t.integer "city_id"
    t.integer "registry_id"
    t.integer "inquery_id"
    t.integer "bo_id"
    t.integer "tco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bo_id"], name: "index_bocs_on_bo_id"
    t.index ["city_id"], name: "index_bocs_on_city_id"
    t.index ["inquery_id"], name: "index_bocs_on_inquery_id"
    t.index ["registry_id"], name: "index_bocs_on_registry_id"
    t.index ["tco_id"], name: "index_bocs_on_tco_id"
  end

  create_table "bos", force: :cascade do |t|
    t.string "n"
    t.date "ocorrencia"
    t.date "fato"
    t.integer "providenca"
    t.integer "nature_id"
    t.integer "city_id"
    t.integer "registry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_bos_on_city_id"
    t.index ["nature_id"], name: "index_bos_on_nature_id"
    t.index ["registry_id"], name: "index_bos_on_registry_id"
  end

  create_table "capitulations", force: :cascade do |t|
    t.string "article"
    t.string "paragraph"
    t.string "subsection"
    t.string "lines"
    t.integer "inquery_id"
    t.integer "law_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquery_id"], name: "index_capitulations_on_inquery_id"
    t.index ["law_id"], name: "index_capitulations_on_law_id"
  end

  create_table "cities", force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inqueries", force: :cascade do |t|
    t.integer "dp"
    t.integer "n"
    t.integer "origem"
    t.integer "tipo"
    t.integer "tp"
    t.date "year"
    t.date "establishment"
    t.date "reported_date"
    t.boolean "reported"
    t.boolean "seizure"
    t.boolean "indiciado"
    t.boolean "conclusion"
    t.string "documento"
    t.integer "registry_id"
    t.integer "city_id"
    t.integer "bo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tco_id"
    t.integer "boc_id"
    t.index ["bo_id"], name: "index_inqueries_on_bo_id"
    t.index ["boc_id"], name: "index_inqueries_on_boc_id"
    t.index ["city_id"], name: "index_inqueries_on_city_id"
    t.index ["registry_id"], name: "index_inqueries_on_registry_id"
    t.index ["tco_id"], name: "index_inqueries_on_tco_id"
  end

  create_table "involveds", force: :cascade do |t|
    t.integer "inquery_id"
    t.integer "person_id"
    t.integer "typeinvolved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquery_id"], name: "index_involveds_on_inquery_id"
    t.index ["person_id"], name: "index_involveds_on_person_id"
  end

  create_table "joins", force: :cascade do |t|
    t.date "date"
    t.integer "inquery_id"
    t.integer "registry_id"
    t.integer "server_id"
    t.string "folha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquery_id"], name: "index_joins_on_inquery_id"
    t.index ["registry_id"], name: "index_joins_on_registry_id"
    t.index ["server_id"], name: "index_joins_on_server_id"
  end

  create_table "joinsanexos", force: :cascade do |t|
    t.integer "join_id"
    t.string "documento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["join_id"], name: "index_joinsanexos_on_join_id"
  end

  create_table "laws", force: :cascade do |t|
    t.string "name"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "name"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "rg"
    t.string "father"
    t.string "mother"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "precatories", force: :cascade do |t|
    t.string "n"
    t.date "year"
    t.string "name"
    t.string "address"
    t.string "bairro"
    t.boolean "conclusion"
    t.date "conclusion_date"
    t.string "ipantigo"
    t.integer "city_id"
    t.integer "server_id"
    t.integer "registry_id"
    t.integer "inquery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_precatories_on_city_id"
    t.index ["inquery_id"], name: "index_precatories_on_inquery_id"
    t.index ["registry_id"], name: "index_precatories_on_registry_id"
    t.index ["server_id"], name: "index_precatories_on_server_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "precatory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["precatory_id"], name: "index_questions_on_precatory_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.integer "dp"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seizures", force: :cascade do |t|
    t.string "name"
    t.integer "procedimento"
    t.integer "destino"
    t.integer "quantidade"
    t.string "doc"
    t.date "data"
    t.boolean "veiculo"
    t.integer "tipo_veiculo"
    t.string "cor"
    t.string "placa"
    t.string "chassi"
    t.integer "inquery_id"
    t.integer "boc_id"
    t.integer "bo_id"
    t.integer "tco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bo_id"], name: "index_seizures_on_bo_id"
    t.index ["boc_id"], name: "index_seizures_on_boc_id"
    t.index ["inquery_id"], name: "index_seizures_on_inquery_id"
    t.index ["tco_id"], name: "index_seizures_on_tco_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "registration"
    t.integer "office"
    t.boolean "active"
    t.integer "registry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registry_id"], name: "index_servers_on_registry_id"
  end

  create_table "tcos", force: :cascade do |t|
    t.integer "dp"
    t.integer "n"
    t.date "year"
    t.date "establishment"
    t.integer "city_id"
    t.integer "registry_id"
    t.boolean "conclusion"
    t.integer "origem"
    t.integer "tipo"
    t.string "documento"
    t.integer "providenca"
    t.integer "inquery_id"
    t.integer "bo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boc_id"
    t.index ["bo_id"], name: "index_tcos_on_bo_id"
    t.index ["boc_id"], name: "index_tcos_on_boc_id"
    t.index ["city_id"], name: "index_tcos_on_city_id"
    t.index ["inquery_id"], name: "index_tcos_on_inquery_id"
    t.index ["registry_id"], name: "index_tcos_on_registry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "registry_id"
    t.integer "role"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["registry_id"], name: "index_users_on_registry_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
