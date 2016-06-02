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

ActiveRecord::Schema.define(version: 20160602192838) do

  create_table "cond_pharmas", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "TR_TARGET_ID",                   limit: 4
    t.string   "TARGET_NAME",                    limit: 255
    t.integer  "DRUG_ID",                        limit: 4
    t.string   "DRUG_NAME",                      limit: 255
    t.integer  "PHARM_RESULT_ID",                limit: 4
    t.integer  "PHARM_EXP_ID",                   limit: 4
    t.string   "TARGET_CONDITION_TOXICITY_TYPE", limit: 255
    t.string   "SYSTEM",                         limit: 255
    t.string   "CONDITION_ACTIVITY_TYPE_VALUE",  limit: 255
    t.string   "EFFECT",                         limit: 255
    t.string   "PHARMACOLOGICAL_ACTIVITY",       limit: 255
    t.string   "MATERIAL",                       limit: 255
    t.string   "METHOD",                         limit: 255
    t.string   "PARAMETER",                      limit: 255
    t.string   "OPERATOR",                       limit: 255
    t.string   "VALUE",                          limit: 255
    t.string   "UNIT",                           limit: 255
    t.string   "VARIANCE",                       limit: 255
    t.string   "MODEL",                          limit: 255
    t.string   "SOURCE_TYPE",                    limit: 255
    t.string   "SOURCE_TITLE",                   limit: 255
    t.string   "SOURCE_ID",                      limit: 255
  end

  add_index "cond_pharmas", ["DRUG_ID"], name: "index_cond_pharmas_on_DRUG_ID", using: :btree
  add_index "cond_pharmas", ["DRUG_NAME"], name: "index_cond_pharmas_on_DRUG_NAME", using: :btree
  add_index "cond_pharmas", ["PHARM_RESULT_ID"], name: "index_cond_pharmas_on_PHARM_RESULT_ID", using: :btree
  add_index "cond_pharmas", ["TARGET_NAME"], name: "index_cond_pharmas_on_TARGET_NAME", using: :btree

  create_table "drugs", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "DRUG_ID",                  limit: 4
    t.string   "TARGET_NAME",              limit: 255
    t.string   "PRODUCT_CATEGORY",         limit: 255
    t.string   "MOLECULAR_MECHANISM",      limit: 1000
    t.string   "CELLULAR_MECHANISM",       limit: 1000
    t.string   "UNDER_ACTIVE_DEVELOPMENT", limit: 255
    t.string   "HIGHEST_PHASE",            limit: 255
    t.string   "SMILES",                   limit: 400
    t.string   "SEQUENCE",                 limit: 255
    t.integer  "TARGET_ID",                limit: 4
    t.string   "OTHER_ORGANIZATIONS",      limit: 1000
    t.string   "CAS_NO",                   limit: 255
    t.string   "CONDITIONS",               limit: 255
    t.string   "DRUG_OR_CHEMICAL_NAME",    limit: 255
    t.string   "LEAD_COMPOUND",            limit: 255
    t.string   "ORIGINATOR_ORGANIZATIONS", limit: 255
  end

  add_index "drugs", ["DRUG_ID"], name: "index_drugs_on_DRUG_ID", using: :btree
  add_index "drugs", ["TARGET_NAME"], name: "index_drugs_on_TARGET_NAME", using: :btree

  create_table "patents", force: :cascade do |t|
    t.integer  "TR_TARGET_ID",            limit: 4
    t.string   "TARGET_NAME",             limit: 255
    t.integer  "DRUG_ID",                 limit: 4
    t.string   "DRUG_NAME",               limit: 255
    t.integer  "INTEGRITY_PATENT_ID",     limit: 4
    t.string   "PATENT_TITLE",            limit: 255
    t.string   "PATENT_NUMBER",           limit: 255
    t.string   "APPLICANT",               limit: 255
    t.string   "INVENTOR",                limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "PATENT_PUBLICATION_DATE", limit: 255
  end

  add_index "patents", ["DRUG_ID"], name: "index_patents_on_DRUG_ID", using: :btree
  add_index "patents", ["INTEGRITY_PATENT_ID"], name: "index_patents_on_INTEGRITY_PATENT_ID", using: :btree

  create_table "pharmacologies", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "TR_TARGET_ID",                   limit: 4
    t.string   "TARGET_NAME",                    limit: 255
    t.integer  "DRUG_ID",                        limit: 4
    t.string   "DRUG_NAME",                      limit: 255
    t.integer  "PHARM_RESULT_ID",                limit: 4
    t.integer  "PHARM_EXP_ID",                   limit: 4
    t.string   "TARGET_CONDITION_TOXICITY_TYPE", limit: 255
    t.string   "SYSTEM",                         limit: 255
    t.string   "CONDITION_ACTIVITY_TYPE_VALUE",  limit: 255
    t.string   "EFFECT",                         limit: 255
    t.string   "PHARMACOLOGICAL_ACTIVITY",       limit: 255
    t.string   "MATERIAL",                       limit: 255
    t.string   "METHOD",                         limit: 255
    t.string   "PARAMETER",                      limit: 255
    t.string   "OPERATOR",                       limit: 255
    t.string   "VALUE",                          limit: 255
    t.string   "UNIT",                           limit: 255
    t.string   "VARIANCE",                       limit: 255
    t.string   "MODEL",                          limit: 255
    t.string   "SOURCE_TYPE",                    limit: 255
    t.string   "SOURCE_TITLE",                   limit: 255
    t.string   "SOURCE_ID",                      limit: 255
  end

  add_index "pharmacologies", ["DRUG_ID"], name: "index_pharmacologies_on_DRUG_ID", using: :btree
  add_index "pharmacologies", ["DRUG_NAME"], name: "index_pharmacologies_on_DRUG_NAME", using: :btree
  add_index "pharmacologies", ["PHARM_RESULT_ID"], name: "index_pharmacologies_on_PHARM_RESULT_ID", using: :btree
  add_index "pharmacologies", ["TARGET_NAME"], name: "index_pharmacologies_on_TARGET_NAME", using: :btree

end
