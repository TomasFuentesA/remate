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

ActiveRecord::Schema.define(version: 2020_04_27_191246) do

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
    t.string "activityable_type"
    t.bigint "activityable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activityable_id", "activityable_type"], name: "index_activities_on_activityable_id_and_activityable_type"
    t.index ["activityable_type", "activityable_id"], name: "index_activities_on_activityable_type_and_activityable_id"
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
    t.index ["auctionnotice_id"], name: "index_auctions_on_auctionnotice_id"
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
    t.integer "region_id"
    t.integer "province_id"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "address"
    t.string "phone"
    t.integer "account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "directions", force: :cascade do |t|
    t.string "rut"
    t.string "directiona"
    t.string "directionb"
    t.string "directionc"
    t.string "directionable_type"
    t.bigint "directionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directionable_id", "directionable_type"], name: "index_directions_on_directionable_id_and_directionable_type"
    t.index ["directionable_type", "directionable_id"], name: "index_directions_on_directionable_type_and_directionable_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "type_modality"
    t.integer "inscription_id"
    t.integer "price"
    t.date "date_posetion"
    t.string "domainable_type"
    t.bigint "domainable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentage"
    t.index ["domainable_id", "domainable_type"], name: "index_domains_on_domainable_id_and_domainable_type"
    t.index ["domainable_type", "domainable_id"], name: "index_domains_on_domainable_type_and_domainable_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "rut"
    t.string "email_a"
    t.string "email_b"
    t.string "email_c"
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_id", "emailable_type"], name: "index_emails_on_emailable_id_and_emailable_type"
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "foja"
    t.integer "number"
    t.integer "year"
    t.string "cbrs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.index ["domain_id"], name: "index_inscriptions_on_domain_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "rut"
    t.string "position"
    t.integer "salary"
    t.string "business"
    t.text "description"
    t.string "jobable_type"
    t.bigint "jobable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobable_id", "jobable_type"], name: "index_jobs_on_jobable_id_and_jobable_type"
    t.index ["jobable_type", "jobable_id"], name: "index_jobs_on_jobable_type_and_jobable_id"
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
    t.bigint "personas_id"
    t.index ["personas_id"], name: "index_legal_personas_on_personas_id"
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
    t.bigint "personas_id"
    t.index ["personas_id"], name: "index_natural_personas_on_personas_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "part1"
    t.string "part2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "judgement_id"
    t.index ["judgement_id"], name: "index_parts_on_judgement_id"
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
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phoneable_id", "phoneable_type"], name: "index_phones_on_phoneable_id_and_phoneable_type"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id"
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
    t.integer "province_id"
    t.integer "region_id"
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
    t.integer "commune_id"
    t.integer "region_id"
    t.integer "province_id"
    t.string "fiscal_destination"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "number_region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_realties", force: :cascade do |t|
    t.string "tipo"
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
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
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

  add_foreign_key "auctionnotices", "realties"
  add_foreign_key "auctions", "auctionnotices"
  add_foreign_key "auctions", "realties"
  add_foreign_key "characteristics", "realties"
  add_foreign_key "comments", "posts"
  add_foreign_key "inscriptions", "domains"
  add_foreign_key "judgements", "auctions"
  add_foreign_key "legal_members", "legal_personas"
  add_foreign_key "legal_members", "legal_personas", column: "legal_asociado_id"
  add_foreign_key "legal_personas", "personas", column: "personas_id"
  add_foreign_key "natural_personas", "personas", column: "personas_id"
  add_foreign_key "parts", "judgements"
  add_foreign_key "persona_members", "legal_personas"
  add_foreign_key "persona_members", "personas"
  add_foreign_key "posts", "users"
  add_foreign_key "type_realties", "realties"
end
