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

ActiveRecord::Schema.define(:version => 20120812212803) do

  create_table "ingredients", :force => true do |t|
    t.integer "quantity"
    t.string  "unit"
    t.string  "name"
    t.string  "note"
    t.integer "recipe_id"
  end

  create_table "inventory_items", :force => true do |t|
    t.string  "name"
    t.string  "brand"
    t.integer "qty"
    t.string  "unit"
    t.boolean "is_standard"
    t.boolean "is_present"
  end

  create_table "recipe_inventory_items", :force => true do |t|
    t.integer "ingredients_id"
    t.integer "inventory_item_id"
  end

  create_table "recipes", :force => true do |t|
    t.string "title"
    t.string "url"
  end

  create_table "steps", :force => true do |t|
    t.string  "description"
    t.integer "ordinal"
    t.integer "recipe_id"
  end

end
