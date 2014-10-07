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

ActiveRecord::Schema.define(:version => 20141007094025) do

  create_table "apprentice_pathways", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "slug"
    t.boolean  "display",    :default => true
  end

  add_index "apprentice_pathways", ["slug"], :name => "index_apprentice_pathways_on_slug"

  create_table "apprentices", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "apprentice_pathway_id"
    t.text     "snippet"
    t.text     "content"
    t.boolean  "highlight",             :default => false
    t.string   "image"
    t.integer  "position",              :default => 0
    t.boolean  "display",               :default => true
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "job_title"
    t.date     "year_attended"
  end

  create_table "articles", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "content"
    t.date     "date"
    t.string   "image"
    t.boolean  "display",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "slug"
  end

  add_index "articles", ["slug"], :name => "index_articles_on_slug"

  create_table "available_apprentices", :force => true do |t|
    t.string   "name"
    t.string   "trade"
    t.date     "date_available_from"
    t.string   "image"
    t.boolean  "display",              :default => true
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "training_location_id"
  end

  create_table "banners", :force => true do |t|
    t.string   "caption"
    t.string   "link"
    t.string   "image"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "position",   :default => 0
    t.boolean  "display",    :default => true
    t.string   "link_text"
  end

  create_table "chronicler_documents", :force => true do |t|
    t.string   "name"
    t.string   "document"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chronicler_images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "image"
    t.integer  "position",   :default => 0
    t.boolean  "display",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "course_categories", :force => true do |t|
    t.string   "title"
    t.string   "colour"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_instances", :force => true do |t|
    t.integer  "course_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "display",              :default => true
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "training_location_id"
    t.string   "slug"
  end

  add_index "course_instances", ["slug"], :name => "index_course_instances_on_slug"

  create_table "course_searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "course_category_id"
    t.string   "course_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "content"
    t.float    "individual_price"
    t.float    "group_price"
    t.integer  "min_place"
    t.integer  "max_place"
    t.integer  "min_group_number"
    t.integer  "max_group_number"
    t.string   "length"
    t.boolean  "bespoke",            :default => false
    t.boolean  "display",            :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "course_category_id"
    t.string   "course_type"
    t.string   "slug"
  end

  add_index "courses", ["slug"], :name => "index_courses_on_slug"

  create_table "footer_icons", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.boolean  "display",    :default => true
    t.integer  "position",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "image"
    t.string   "image_alt"
    t.string   "caption"
    t.boolean  "display",    :default => true
    t.integer  "position",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "manticore_administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_send_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "layout"
    t.string   "style"
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.string   "slug"
    t.boolean  "display",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "seo_entries", :force => true do |t|
    t.string   "nominal_url"
    t.string   "title"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.boolean  "in_sitemap",       :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "team_members", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "job_title"
    t.text     "summary"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "display"
  end

  create_table "training_locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.text     "directions"
    t.text     "booking_details"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "willow_branches", :force => true do |t|
    t.string   "tree"
    t.string   "name"
    t.integer  "position",              :default => 0
    t.string   "ancestry"
    t.integer  "ancestry_depth",        :default => 0
    t.string   "positions_depth_cache"
    t.integer  "leaf_id"
    t.string   "leaf_type"
    t.boolean  "sturdy",                :default => false
    t.boolean  "can_have_children",     :default => false
    t.boolean  "primary",               :default => false
    t.string   "access_key"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "willow_branches", ["ancestry"], :name => "index_willow_branches_on_ancestry"

  create_table "willow_leaves", :force => true do |t|
    t.string "name"
    t.string "route"
    t.string "type"
  end

end
