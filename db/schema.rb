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

ActiveRecord::Schema.define(version: 2020_04_29_215452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "rut"
    t.string "code"
    t.string "name_activity"
    t.string "afect_iva"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appraisals", force: :cascade do |t|
    t.date "date"
    t.string "entity"
    t.float "price_uf"
    t.float "price_clp"
    t.float "price_usd"
    t.string "observation"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_appraisals_on_realty_id"
  end

  create_table "auctionlistings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attached"
  end

  create_table "auctionnotices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "auction"
    t.integer "status", default: 0
    t.bigint "realty_id"
    t.index ["realty_id"], name: "index_auctionnotices_on_realty_id"
  end

  create_table "auctions", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.float "cost"
    t.float "uf"
    t.float "pesos"
    t.float "total_minimum"
    t.float "warranty"
    t.float "fee"
    t.string "name"
    t.string "lyrics"
    t.integer "number"
    t.integer "year"
    t.bigint "auctionnotice_id"
    t.bigint "realty_id"
    t.bigint "court_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "minimum"
    t.integer "status"
    t.integer "type_judgment"
    t.bigint "judgement_id"
    t.index ["auctionnotice_id"], name: "index_auctions_on_auctionnotice_id"
    t.index ["judgement_id"], name: "index_auctions_on_judgement_id"
    t.index ["realty_id"], name: "index_auctions_on_realty_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.float "m2_land"
    t.float "m2_built"
    t.string "material"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "built_year"
    t.index ["realty_id"], name: "index_characteristics_on_realty_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.integer "cod_treasury"
    t.integer "conara_sii"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "province_id"
    t.index ["province_id"], name: "index_communes_on_province_id"
  end

  create_table "condominios", force: :cascade do |t|
    t.string "name"
    t.bigint "persona_id"
    t.bigint "legal_persona_id"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "realty_id"
    t.index ["commune_id"], name: "index_condominios_on_commune_id"
    t.index ["legal_persona_id"], name: "index_condominios_on_legal_persona_id"
    t.index ["persona_id"], name: "index_condominios_on_persona_id"
    t.index ["realty_id"], name: "index_condominios_on_realty_id"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "address"
    t.string "phone"
    t.integer "account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "judgement_id"
    t.index ["judgement_id"], name: "index_courts_on_judgement_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string "rut"
    t.string "directiona"
    t.string "directionb"
    t.string "directionc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string "type_modality"
    t.integer "inscription_id"
    t.integer "price"
    t.date "date_posetion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentage"
  end

  create_table "emails", force: :cascade do |t|
    t.string "rut"
    t.string "email_a"
    t.string "email_b"
    t.string "email_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "foja"
    t.integer "number"
    t.integer "year"
    t.string "cbrs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.date "date"
    t.index ["domain_id"], name: "index_inscriptions_on_domain_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "rut"
    t.string "position"
    t.integer "salary"
    t.string "business"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judgements", force: :cascade do |t|
    t.integer "type_judgement", default: 0
    t.bigint "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_judgements_on_auction_id"
  end

  create_table "legal_members", force: :cascade do |t|
    t.bigint "legal_persona_id"
    t.bigint "legal_asociado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_asociado_id"], name: "index_legal_members_on_legal_asociado_id"
    t.index ["legal_persona_id"], name: "index_legal_members_on_legal_persona_id"
  end

  create_table "legal_personas", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.string "fantasy_name"
    t.string "alias"
    t.string "web"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legal_represents", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "natural_personas", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.string "name2"
    t.string "apellido_pat"
    t.string "apellido_mat"
    t.string "e_civil"
    t.string "profesion"
    t.date "fecha_nac"
    t.string "alias"
    t.string "nacionality"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "part1"
    t.string "part2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "judgement_id"
    t.index ["judgement_id"], name: "index_parts_on_judgement_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.integer "actividad_id"
    t.string "last_name1"
    t.string "last_name2"
    t.integer "phone_id"
    t.integer "mail_id"
    t.string "direction_id"
    t.string "photo"
    t.string "e_civil"
    t.string "profesion"
    t.date "birth_date"
    t.string "nacionality"
    t.string "passport"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name2"
  end

  create_table "persona_members", force: :cascade do |t|
    t.bigint "persona_id", null: false
    t.bigint "legal_persona_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_persona_id"], name: "index_persona_members_on_legal_persona_id"
    t.index ["persona_id"], name: "index_persona_members_on_persona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "name"
    t.string "name2"
    t.string "rut"
    t.string "last_name1"
    t.string "last_name2"
    t.string "e_civil"
    t.string "profesion"
    t.date "birth_date"
    t.string "nacionality"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "rut"
    t.string "phone_a"
    t.string "phone_b"
    t.string "phone_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "realties", force: :cascade do |t|
    t.string "street"
    t.integer "number_unit"
    t.string "unit_estate"
    t.integer "street_type_id"
    t.string "population_villa"
    t.integer "apple"
    t.integer "property"
    t.text "name_realty"
    t.float "mt2_land"
    t.float "mt2_built"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "type_property_id"
    t.bigint "commune_id"
    t.string "fiscal_destination"
    t.index ["commune_id"], name: "index_realties_on_commune_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "number_region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_realties", force: :cascade do |t|
    t.integer "tipo"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "realty_id"
    t.integer "bathroom"
    t.integer "parking_lot"
    t.integer "cellar"
    t.integer "bedroom"
    t.integer "ambient"
    t.index ["realty_id"], name: "index_type_realties_on_realty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 4
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "provider"
    t.string "uid"
    t.string "rut"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appraisals", "realties"
  add_foreign_key "auctionnotices", "realties"
  add_foreign_key "auctions", "auctionnotices"
  add_foreign_key "auctions", "realties"
  add_foreign_key "characteristics", "realties"
  add_foreign_key "comments", "posts"
  add_foreign_key "communes", "provinces"
  add_foreign_key "condominios", "communes"
  add_foreign_key "condominios", "legal_personas"
  add_foreign_key "condominios", "personas"
  add_foreign_key "condominios", "realties"
  add_foreign_key "inscriptions", "domains"
  add_foreign_key "judgements", "auctions"
  add_foreign_key "legal_members", "legal_personas"
  add_foreign_key "legal_members", "legal_personas", column: "legal_asociado_id"
  add_foreign_key "parts", "judgements"
  add_foreign_key "persona_members", "legal_personas"
  add_foreign_key "persona_members", "personas"
  add_foreign_key "posts", "users"
  add_foreign_key "provinces", "regions"
  add_foreign_key "type_realties", "realties"
end
