# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_29_221342) do

  create_table "poll_answers", force: :cascade do |t|
    t.integer "poll_id", null: false
    t.integer "answer"
    t.text "textanswer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_poll_answers_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "question"
    t.text "options"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_polls_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.text "title"
    t.boolean "closed"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "poll_answers", "polls"
  add_foreign_key "polls", "surveys"
end
