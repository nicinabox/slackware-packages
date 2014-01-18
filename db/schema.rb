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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140117033157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slackware_versions", force: true do |t|
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "version"
    t.text     "description"
    t.text     "original_description"
    t.text     "summary"
    t.string   "build"
    t.string   "arch"
    t.integer  "size_compressed"
    t.integer  "size_uncompressed"
    t.string   "filename"
    t.integer  "package_id"
    t.integer  "slackware_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
