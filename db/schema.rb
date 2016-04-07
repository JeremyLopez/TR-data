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

ActiveRecord::Schema.define(version: 20160407143649) do

  create_table "cond_pharmas", force: :cascade do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "TR_TARGET_ID",                   limit: 20
    t.string   "TARGET_NAME"
    t.integer  "DRUG_ID",                        limit: 20
    t.string   "DRUG_NAME"
    t.integer  "PHARM_RESULT_ID",                limit: 20
    t.integer  "PHARM_EXP_ID",                   limit: 20
    t.string   "TARGET_CONDITION_TOXICITY_TYPE"
    t.string   "SYSTEM"
    t.string   "CONDITION_ACTIVITY_TYPE_VALUE"
    t.string   "EFFECT"
    t.string   "PHARMACOLOGICAL_ACTIVITY"
    t.string   "MATERIAL"
    t.string   "METHOD"
    t.string   "PARAMETER"
    t.string   "OPERATOR"
    t.string   "VALUE"
    t.string   "UNIT"
    t.string   "VARIANCE"
    t.string   "MODEL"
    t.string   "SOURCE_TYPE"
    t.string   "SOURCE_TITLE"
    t.string   "SOURCE_ID"
  end

  add_index "cond_pharmas", ["DRUG_ID"], name: "index_cond_pharmas_on_DRUG_ID"
  add_index "cond_pharmas", ["DRUG_NAME"], name: "index_cond_pharmas_on_DRUG_NAME"
  add_index "cond_pharmas", ["PHARM_RESULT_ID"], name: "index_cond_pharmas_on_PHARM_RESULT_ID"
  add_index "cond_pharmas", ["TARGET_NAME"], name: "index_cond_pharmas_on_TARGET_NAME"

  create_table "drugs", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "TR_TARGET_ID",             limit: 20
    t.integer  "DRUG_ID",                  limit: 20
    t.integer  "INTEGRITY_PATENT_ID",      limit: 20
    t.string   "TARGET_NAME"
    t.string   "DRUG_NAME"
    t.string   "PRODUCT_CATEGORY"
    t.string   "MOLECULAR_MECHANISM"
    t.string   "CELLULAR_MECHANISM"
    t.string   "UNDER_ACTIVE_DEVELOPMENT"
    t.string   "HIGHEST_PHASE"
    t.string   "INACTIVE_CONDITIONS"
    t.string   "ORIGINATOR_ORGANIZATION"
    t.string   "INACTIVE_ORGANIZATION"
    t.string   "ACTIVE_CONDITIONS"
    t.string   "SMILES"
    t.string   "SEQUENCE"
    t.string   "CAS_NUMBER"
    t.string   "CORTELLIS_ID"
    t.string   "ACTIVE_ORGANIZATION"
  end

  add_index "drugs", ["DRUG_ID"], name: "index_drugs_on_DRUG_ID"
  add_index "drugs", ["DRUG_NAME"], name: "index_drugs_on_DRUG_NAME"
  add_index "drugs", ["INTEGRITY_PATENT_ID"], name: "index_drugs_on_INTEGRITY_PATENT_ID"
  add_index "drugs", ["TARGET_NAME"], name: "index_drugs_on_TARGET_NAME"
  add_index "drugs", ["TR_TARGET_ID"], name: "index_drugs_on_TR_TARGET_ID"

  create_table "patents", force: :cascade do |t|
    t.integer  "TR_TARGET_ID",            limit: 20
    t.string   "TARGET_NAME"
    t.integer  "DRUG_ID",                 limit: 20
    t.string   "DRUG_NAME"
    t.integer  "INTEGRITY_PATENT_ID",     limit: 20
    t.string   "PATENT_TITLE",            limit: 100
    t.string   "PATENT_NUMBER"
    t.string   "APPLICANT"
    t.string   "INVENTOR"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "PATENT_PUBLICATION_DATE"
  end

  add_index "patents", ["DRUG_ID"], name: "index_patents_on_DRUG_ID"
  add_index "patents", ["INTEGRITY_PATENT_ID"], name: "index_patents_on_INTEGRITY_PATENT_ID"

  create_table "pharmacologies", force: :cascade do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "TR_TARGET_ID",                   limit: 20
    t.string   "TARGET_NAME"
    t.integer  "DRUG_ID",                        limit: 20
    t.string   "DRUG_NAME"
    t.integer  "PHARM_RESULT_ID",                limit: 20
    t.integer  "PHARM_EXP_ID",                   limit: 20
    t.string   "TARGET_CONDITION_TOXICITY_TYPE"
    t.string   "SYSTEM"
    t.string   "CONDITION_ACTIVITY_TYPE_VALUE"
    t.string   "EFFECT"
    t.string   "PHARMACOLOGICAL_ACTIVITY"
    t.string   "MATERIAL"
    t.string   "METHOD"
    t.string   "PARAMETER"
    t.string   "OPERATOR"
    t.string   "VALUE"
    t.string   "UNIT"
    t.string   "VARIANCE"
    t.string   "MODEL"
    t.string   "SOURCE_TYPE"
    t.string   "SOURCE_TITLE"
    t.string   "SOURCE_ID"
  end

  add_index "pharmacologies", ["DRUG_ID"], name: "index_pharmacologies_on_DRUG_ID"
  add_index "pharmacologies", ["DRUG_NAME"], name: "index_pharmacologies_on_DRUG_NAME"
  add_index "pharmacologies", ["PHARM_RESULT_ID"], name: "index_pharmacologies_on_PHARM_RESULT_ID"
  add_index "pharmacologies", ["TARGET_NAME"], name: "index_pharmacologies_on_TARGET_NAME"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
