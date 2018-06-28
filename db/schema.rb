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

ActiveRecord::Schema.define(version: 2018_06_27_200007) do

  create_table "keywords", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_keywords", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_result_keywords_on_keyword_id"
    t.index ["result_id"], name: "index_result_keywords_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "url"
    t.string "author"
    t.date "published_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "snippet"
    t.string "title"
    t.string "abstract"
    t.string "full_text"
    t.integer "search_id"
    t.string "page_id"
    t.index ["search_id"], name: "index_results_on_search_id"
  end

  create_table "search_results", force: :cascade do |t|
    t.integer "search_id"
    t.integer "result_id"
    t.boolean "keep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_search_results_on_result_id"
    t.index ["search_id"], name: "index_search_results_on_search_id"
  end

  create_table "search_terms", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "search_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_search_terms_on_keyword_id"
    t.index ["search_id"], name: "index_search_terms_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "topic_id"
    t.date "date_searched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_searches_on_topic_id"
  end

  create_table "supporting_docs", force: :cascade do |t|
    t.integer "result_id"
    t.integer "synth_content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_supporting_docs_on_result_id"
    t.index ["synth_content_id"], name: "index_supporting_docs_on_synth_content_id"
  end

  create_table "synth_contents", force: :cascade do |t|
    t.integer "topic_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_synth_contents_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
