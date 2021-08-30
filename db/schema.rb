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

ActiveRecord::Schema.define(version: 2021_08_26_030122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choir_members", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "active"
    t.string "voice_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "choir_id"
    t.index ["choir_id"], name: "index_choir_members_on_choir_id"
  end

  create_table "choirs", force: :cascade do |t|
    t.string "name"
    t.integer "openings"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbing_gyms", force: :cascade do |t|
    t.string "name"
    t.boolean "ropes"
    t.integer "total_routes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
  end

  create_table "gym_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "belay_status"
    t.integer "monthly_checkins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "climbing_gym_id"
    t.index ["climbing_gym_id"], name: "index_gym_members_on_climbing_gym_id"
  end

=======

  end

  create_table "gym_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "belay_status"
    t.integer "monthly_checkins"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "climbing_gym_id"
    t.index ["climbing_gym_id"], name: "index_gym_members_on_climbing_gym_id"
  end

>>>>>>> 10237bb2c59c73c8f61afa51127c7bdf4343a534
  add_foreign_key "choir_members", "choirs"
  add_foreign_key "gym_members", "climbing_gyms"
end
