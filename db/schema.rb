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

ActiveRecord::Schema.define(:version => 20121028204440) do

  create_table "certificates", :force => true do |t|
    t.integer  "certifiable_id"
    t.string   "uuid"
    t.string   "event"
    t.boolean  "sent"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "certifiable_type"
    t.string   "lecture"
    t.string   "kind"
    t.string   "course"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "duration"
    t.string   "topics"
    t.string   "course_code"
  end

  add_index "certificates", ["certifiable_id"], :name => "index_certificates_on_certifiable_id"
  add_index "certificates", ["certifiable_type"], :name => "index_certificates_on_certifiable_type"
  add_index "certificates", ["uuid"], :name => "index_certificates_on_uuid"

  create_table "lecturers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "resume"
  end

  create_table "send_attempts", :force => true do |t|
    t.string   "message"
    t.integer  "certificate_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "send_attempts", ["certificate_id"], :name => "index_send_attempts_on_certificate_id"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "address"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "sex"
    t.date     "birth_date"
    t.string   "occupation"
    t.string   "address_complement"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
