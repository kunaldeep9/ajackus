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

ActiveRecord::Schema.define(version: 20200419124327) do

  create_table "ab_trackings", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "parameter",      limit: 1,  default: 1,              comment: "1=>Order,2=>Register"
    t.bigint   "value",                     default: 0, null: false,                                  unsigned: true
    t.string   "tracking_value", limit: 30
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["parameter", "value"], name: "index_ab_trackings_on_parameter_and_value", unique: true, using: :btree
  end

  create_table "add_to_cart_times", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_product_id", default: 0, null: false, unsigned: true
    t.datetime "add_to_cart_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["order_product_id"], name: "index_add_to_cart_times_on_order_product_id", unique: true, using: :btree
  end

  create_table "addresses", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                        default: 0, null: false,                                               unsigned: true
    t.string   "first_name",       limit: 100
    t.string   "last_name",        limit: 100
    t.string   "pincode",          limit: 15
    t.string   "landmark"
    t.text     "address",          limit: 65535
    t.string   "mobile",           limit: 15
    t.integer  "status",           limit: 1,     default: 1,              comment: "0=>disabled 1=>enabled 2=>default"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "orders_count",                   default: 0
    t.integer  "sub_type",         limit: 1,     default: 0
    t.string   "alternate_mobile", limit: 15
    t.index ["city"], name: "index_addresses_on_city", using: :btree
    t.index ["country"], name: "index_addresses_on_country", using: :btree
    t.index ["first_name"], name: "index_addresses_on_first_name", type: :fulltext
    t.index ["last_name"], name: "index_addresses_on_last_name", type: :fulltext
    t.index ["mobile"], name: "index_addresses_on_mobile", using: :btree
    t.index ["pincode"], name: "index_addresses_on_pincode", using: :btree
    t.index ["state"], name: "index_addresses_on_state", using: :btree
    t.index ["status"], name: "index_addresses_on_status", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "admin_user_groups", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "admin_user_id", default: 0, unsigned: true
    t.integer  "group_id",      default: 0, unsigned: true
    t.integer  "status",        default: 0, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["admin_user_id"], name: "index_admin_user_groups_on_admin_user_id", using: :btree
    t.index ["group_id"], name: "index_admin_user_groups_on_group_id", using: :btree
  end

  create_table "admin_users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "email",                  limit: 50
    t.string   "personal_email",         limit: 50
    t.string   "encrypted_password",     limit: 70, default: "",    null: false
    t.string   "designation",            limit: 50
    t.string   "department",             limit: 50
    t.boolean  "enable",                            default: true
    t.boolean  "can_login",                         default: false
    t.boolean  "can_sales_login",                   default: false
    t.integer  "login_attempt",                     default: 0,                                                       unsigned: true
    t.string   "mobile",                 limit: 15, default: ""
    t.string   "mobile_other",           limit: 15, default: ""
    t.string   "reset_password_token",   limit: 10
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          limit: 1,  default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 20
    t.string   "last_sign_in_ip",        limit: 20
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "employee_code",                                                                                       unsigned: true
    t.integer  "office_location",                   default: 0,                  comment: "ghatkopar=>0,bhiwnadi=>1", unsigned: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  end

  create_table "alphameric_series", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "series",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "app_object_audit_trails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "author"
    t.string   "event"
    t.integer  "app_object_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "app_objects", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "object_type",                                 null: false
    t.text     "object_value",   limit: 16777215
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "object_version"
    t.integer  "status",                          default: 0
    t.text     "comment",        limit: 65535
    t.datetime "last_saved_at"
    t.integer  "last_saved_by"
    t.index ["object_type"], name: "index_app_objects_on_object_type", using: :btree
  end

  create_table "app_versions", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "version",                   default: 0,                                                                                              unsigned: true
    t.integer  "status",      limit: 1,     default: 0,              comment: "0=>No update required, 1=>update not mandatory, 2=>update mandatory"
    t.integer  "device_type", limit: 1
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "message",     limit: 65535
    t.integer  "update_type"
    t.index ["device_type"], name: "index_app_versions_on_device_type", using: :btree
  end

  create_table "associated_tags", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["taggable_type", "taggable_id"], name: "index_associated_tags_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "associated_tags_bkp", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "id",            default: 0, null: false, unsigned: true
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "bank_refunds", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                   default: 0, null: false, unsigned: true
    t.string   "customer_name",  limit: 100
    t.string   "ifsc_code"
    t.string   "account_number"
    t.integer  "status",         limit: 1,   default: 0
    t.float    "amount",         limit: 24
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "reason"
    t.string   "transaction_id"
    t.string   "sap_data"
    t.string   "sap_status",     limit: 30
    t.index ["account_number"], name: "index_bank_refunds_on_account_number", using: :btree
    t.index ["order_id"], name: "index_bank_refunds_on_order_id", using: :btree
    t.index ["status"], name: "index_bank_refunds_on_status", using: :btree
  end

  create_table "bewakoof_challan_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bewakoof_challan_id",                     default: 0,              unsigned: true
    t.integer  "purchase_order_product_id",               default: 0,              unsigned: true
    t.integer  "qty_received",                            default: 0,              unsigned: true
    t.integer  "qty_counting",                            default: 0,              unsigned: true
    t.integer  "qty_ok",                                  default: 0,              unsigned: true
    t.integer  "qty_rejection",                           default: 0,              unsigned: true
    t.integer  "qty_alteration",                          default: 0,              unsigned: true
    t.integer  "qty_dagi",                                default: 0,              unsigned: true
    t.integer  "qty_kandi",                               default: 0,              unsigned: true
    t.integer  "qty_printing",                            default: 0,              unsigned: true
    t.integer  "qty_rejected",                            default: 0,              unsigned: true
    t.integer  "qty_rip_shade",                           default: 0,              unsigned: true
    t.integer  "qty_others",                              default: 0,              unsigned: true
    t.text     "remarks",                   limit: 65535
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["bewakoof_challan_id"], name: "index_bewakoof_challan_products_on_bewakoof_challan_id", using: :btree
    t.index ["purchase_order_product_id"], name: "index_bewakoof_challan_products_on_purchase_order_product_id", using: :btree
  end

  create_table "bewakoof_challans", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "purchase_order_id", default: 0,              unsigned: true
    t.integer  "vendor_challan_no", default: 0,              unsigned: true
    t.date     "received_date"
    t.integer  "admin_user_id",     default: 0,              unsigned: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["admin_user_id"], name: "index_bewakoof_challans_on_admin_user_id", using: :btree
    t.index ["purchase_order_id"], name: "index_bewakoof_challans_on_purchase_order_id", using: :btree
    t.index ["vendor_challan_no"], name: "index_bewakoof_challans_on_vendor_challan_no", using: :btree
  end

  create_table "bin_cycle_count_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bin_cycle_count_id",                        default: 0,                  unsigned: true
    t.integer  "sku",                                       default: 0,                  unsigned: true
    t.integer  "previous_quantity",                         default: 0,                  unsigned: true
    t.integer  "previous_untracked_quantity",               default: 0,                  unsigned: true
    t.integer  "current_quantity",                          default: 0,                  unsigned: true
    t.integer  "current_untracked_quantity",                default: 0,                  unsigned: true
    t.integer  "extra_quantity",                            default: 0,                  unsigned: true
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.bigint   "piece_wise_barcode_id",                     default: 0,     null: false, unsigned: true
    t.string   "pwb_barcode",                 limit: 30
    t.integer  "previous_inventory_status",                                              unsigned: true
    t.integer  "current_inventory_status",                                               unsigned: true
    t.boolean  "is_extra",                                  default: false
    t.text     "error_message",               limit: 65535
    t.index ["bin_cycle_count_id"], name: "index_bin_cycle_count_products_on_bin_cycle_count_id", using: :btree
    t.index ["pwb_barcode"], name: "index_bin_cycle_count_products_on_pwb_barcode", using: :btree
  end

  create_table "bin_cycle_counts", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bin_id",        default: 0,              unsigned: true
    t.integer  "admin_user_id", default: 0,              unsigned: true
    t.integer  "crate_id",      default: 0,              unsigned: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["admin_user_id"], name: "index_bin_cycle_counts_on_admin_user_id", using: :btree
    t.index ["bin_id"], name: "index_bin_cycle_counts_on_bin_id", using: :btree
  end

  create_table "bin_inventories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bin_id",             default: 0,              unsigned: true
    t.integer  "sku",                default: 0,              unsigned: true
    t.integer  "sku_type",           default: 0,              unsigned: true
    t.integer  "quantity",           default: 0,              unsigned: true
    t.datetime "last_added_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "last_removed_at"
    t.integer  "untracked_quantity", default: 0,              unsigned: true
    t.index ["bin_id", "sku", "sku_type"], name: "index_bin_inventories_on_bin_id_and_sku", unique: true, using: :btree
    t.index ["quantity"], name: "index_bin_inventories_on_quantity", using: :btree
    t.index ["sku", "sku_type"], name: "index_bin_inventories_on_sku_and_sku_type", using: :btree
  end

  create_table "bin_inventory_transactions", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "from_bin_name",         limit: 20
    t.string   "to_bin_name",           limit: 20
    t.integer  "from_bin_inventory_id",             default: 0, unsigned: true
    t.integer  "to_bin_inventory_id",               default: 0, unsigned: true
    t.integer  "sku",                               default: 0, unsigned: true
    t.integer  "sku_type",                          default: 0, unsigned: true
    t.integer  "quantity",                          default: 0
    t.integer  "admin_user_id",                     default: 0, unsigned: true
    t.integer  "reference_id",                      default: 0, unsigned: true
    t.integer  "reference_type",                    default: 0, unsigned: true
    t.string   "remarks",               limit: 100
    t.datetime "created_at"
    t.integer  "panel_id",                          default: 0, unsigned: true
    t.integer  "untracked_quantity",                default: 0
    t.string   "pwb_barcode",           limit: 30
    t.integer  "plant",                             default: 0, unsigned: true
    t.string   "action",                limit: 20
    t.index ["admin_user_id"], name: "index_bin_inventory_transactions_on_admin_user_id", using: :btree
    t.index ["created_at"], name: "index_bin_inventory_transactions_on_created_at", using: :btree
    t.index ["from_bin_name"], name: "index_bin_inventory_transactions_on_from_bin_name", using: :btree
    t.index ["panel_id"], name: "index_bin_inventory_transactions_on_panel_id", using: :btree
    t.index ["to_bin_name"], name: "index_bin_inventory_transactions_on_to_bin_name", using: :btree
  end

  create_table "bin_picklist_logic_services", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "bin_picklist_logic_id", default: 0, null: false, unsigned: true
    t.bigint   "service_id",            default: 0, null: false, unsigned: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "bin_picklist_logics", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",          limit: 10
    t.integer  "status",                   default: 0,              comment: "0=>inactive,1=>active",                                           unsigned: true
    t.integer  "admin_user_id",            default: 0,                                                                                          unsigned: true
    t.string   "description"
    t.integer  "date_type",                                         comment: "0=>pickable_date,1=>order_placed_date,2=>expected_shipping_date", unsigned: true
    t.integer  "time_type",                                                                                                                     unsigned: true
    t.date     "date_from"
    t.date     "date_to"
    t.string   "hour_min_from", limit: 5
    t.string   "hour_min_to",   limit: 5
    t.integer  "range_from",    limit: 2
    t.integer  "range_to",      limit: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["name"], name: "index_bin_picklist_logics_on_name", using: :btree
    t.index ["status"], name: "index_bin_picklist_logics_on_status", using: :btree
  end

  create_table "bin_picklist_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bin_picklist_id",                    default: 0,                                                                                      unsigned: true
    t.integer  "sku",                                default: 0,                                                                                      unsigned: true
    t.integer  "quantity",                           default: 0,                                                                                      unsigned: true
    t.integer  "bin_id",                             default: 0,                                                                                      unsigned: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "packing_quantity",                   default: 0,                                                                                      unsigned: true
    t.integer  "crate_quantity",                     default: 0,                                                                                      unsigned: true
    t.integer  "not_found_quantity",                 default: 0,                                                                                      unsigned: true
    t.string   "packing_station_bin_ids"
    t.bigint   "order_id",                                                                                                                            unsigned: true
    t.bigint   "piece_wise_barcode_id",              default: 0, null: false,                                                                         unsigned: true
    t.string   "pwb_barcode",             limit: 30,             null: false
    t.integer  "status",                             default: 0,              comment: "0=>not_picked,1=>picked,2=>not_found,3=>packed,4=>cancelled", unsigned: true
    t.integer  "packing_station_id",                 default: 0,                                                                                      unsigned: true
    t.index ["bin_picklist_id"], name: "index_bin_picklist_products_on_bin_picklist_id", using: :btree
    t.index ["piece_wise_barcode_id", "bin_picklist_id", "status"], name: "index_bpp_pwb_id_and_bp_id_and_status", using: :btree
    t.index ["sku"], name: "index_bin_picklist_products_on_sku", using: :btree
    t.index ["status"], name: "index_bin_picklist_products_on_status", using: :btree
  end

  create_table "bin_picklists", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                  limit: 30
    t.string   "row",                   limit: 810
    t.integer  "status",                            default: 0,              unsigned: true
    t.integer  "admin_user_id",                     default: 0,              unsigned: true
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "reason",                            default: 0,              unsigned: true
    t.integer  "crate_id",                          default: 0,              unsigned: true
    t.string   "floor",                 limit: 5
    t.integer  "packing_station_id",                default: 0,              unsigned: true
    t.integer  "logic",                 limit: 2
    t.integer  "feeding_area_id",                   default: 0,              unsigned: true
    t.integer  "picklist_type",                     default: 0,              unsigned: true
    t.integer  "bin_picklist_logic_id",             default: 0,              unsigned: true
    t.integer  "capacity",                          default: 0,              unsigned: true
    t.string   "start_bin_name",        limit: 20
    t.integer  "created_by",                        default: 0,              unsigned: true
    t.index ["bin_picklist_logic_id"], name: "index_bin_picklists_on_bin_picklist_logic_id", using: :btree
    t.index ["crate_id"], name: "index_bin_picklists_on_crate_id", using: :btree
    t.index ["floor"], name: "index_bin_picklists_on_floor", using: :btree
    t.index ["name"], name: "index_bin_picklists_on_name", unique: true, using: :btree
    t.index ["picklist_type"], name: "index_bin_picklists_on_picklist_type", using: :btree
    t.index ["status"], name: "index_bin_picklists_on_status", using: :btree
  end

  create_table "bin_problem_solvers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "sku",                                       unsigned: true
    t.integer  "problem_quantity", default: 0,              unsigned: true
    t.integer  "solved_quantity",  default: 0,              unsigned: true
    t.integer  "status",           default: 0,              unsigned: true
    t.integer  "entry_type",       default: 0,              unsigned: true
    t.integer  "admin_user_id",    default: 0,              unsigned: true
    t.integer  "bin_picklist_id",                           unsigned: true
    t.integer  "reference_id",     default: 0,              unsigned: true
    t.integer  "reference_type",   default: 0,              unsigned: true
    t.integer  "reason",           default: 0,              unsigned: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "bin_rows", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",          limit: 5
    t.integer  "plant",                   default: 0,              unsigned: true
    t.string   "floor",         limit: 5
    t.integer  "area",                    default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "admin_user_id",           default: 0,              unsigned: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["area"], name: "index_bin_rows_on_area", using: :btree
    t.index ["plant", "floor", "name"], name: "index_bin_rows_on_plant_and_floor_and_name", unique: true, using: :btree
  end

  create_table "bins", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bin_type",                 default: 0,              unsigned: true
    t.integer  "plant",                    default: 0,              unsigned: true
    t.string   "name",          limit: 20
    t.string   "row",           limit: 5
    t.integer  "capacity",                 default: 0,              unsigned: true
    t.integer  "admin_user_id",            default: 0,              unsigned: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "floor",         limit: 5
    t.integer  "shelf",                    default: 0,              unsigned: true
    t.integer  "number",                   default: 0,              unsigned: true
    t.integer  "status",                   default: 0,              unsigned: true
    t.integer  "bin_row_id",               default: 0,              unsigned: true
    t.string   "sort_name",     limit: 20
    t.index ["bin_row_id"], name: "index_bins_on_bin_row_id", using: :btree
    t.index ["floor"], name: "index_bins_on_floor", using: :btree
    t.index ["name"], name: "index_bins_on_name", unique: true, using: :btree
    t.index ["number"], name: "index_bins_on_number", using: :btree
    t.index ["row"], name: "index_bins_on_row", using: :btree
    t.index ["status"], name: "index_bins_on_status", using: :btree
  end

  create_table "blacklist_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "identifier"
    t.string   "identifier_type"
    t.integer  "status",          limit: 1,     default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "reason",          limit: 65535
    t.index ["identifier", "identifier_type"], name: "by_all_columns", unique: true, using: :btree
  end

  create_table "bluedart_cod", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "pincode"
    t.string  "area_code",    limit: 13
    t.string  "routing_code", limit: 13
    t.index ["pincode"], name: "pincode", using: :btree
  end

  create_table "bluedart_prepaid", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "pincode"
    t.string  "area_code",    limit: 13
    t.string  "routing_code", limit: 13
    t.index ["pincode"], name: "pincode", using: :btree
  end

  create_table "bulk_expenses", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "amount",                default: 0, unsigned: true
    t.integer "invoice_id",            default: 0, unsigned: true
    t.string  "year",       limit: 10
    t.index ["invoice_id"], name: "index_bulk_expenses_on_invoice_id", using: :btree
  end

  create_table "bulk_invoice_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "product_description"
    t.integer  "quantity",                       default: 0,              unsigned: true
    t.integer  "rate",                           default: 0,              unsigned: true
    t.integer  "discount",                       default: 0,              unsigned: true
    t.integer  "invoice_id",                     default: 0,              unsigned: true
    t.integer  "amount",                         default: 0,              unsigned: true
    t.string   "year",                limit: 10
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["invoice_id"], name: "index_bulk_invoice_products_on_invoice_id", using: :btree
  end

  create_table "bulk_invoices", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "year",              limit: 10
    t.integer  "invoice_id",                   default: 0,                  unsigned: true
    t.date     "added_date"
    t.integer  "billing_client_id",            default: 0,                  unsigned: true
    t.integer  "advance_amount",               default: 0,                  unsigned: true
    t.integer  "tax_type",          limit: 1
    t.float    "tax_amount",        limit: 24
    t.date     "make_date"
    t.integer  "admin_user_id",                default: 0,                  unsigned: true
    t.boolean  "is_generated",                 default: false
    t.boolean  "is_send",                      default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["admin_user_id"], name: "index_bulk_invoices_on_admin_user_id", using: :btree
    t.index ["billing_client_id"], name: "index_bulk_invoices_on_billing_client_id", using: :btree
    t.index ["invoice_id"], name: "index_bulk_invoices_on_invoice_id", using: :btree
  end

  create_table "campaign_boxes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                   null: false
    t.string   "site_thumb"
    t.string   "mobile_thumb"
    t.string   "url",                                    null: false
    t.integer  "campaign_page_id",           default: 0,              unsigned: true
    t.integer  "sort",             limit: 2
    t.integer  "status",           limit: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["campaign_page_id"], name: "index_campaign_boxes_on_campaign_page_id", using: :btree
  end

  create_table "campaign_pages", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title",                          null: false
    t.string   "text_color",       limit: 10,    null: false
    t.string   "background_color", limit: 10,    null: false
    t.string   "url",                            null: false
    t.text     "seo_title",        limit: 65535
    t.text     "seo_description",  limit: 65535
    t.text     "seo_keywords",     limit: 65535
    t.string   "footer"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "updated_at"
  end

  create_table "cards", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                 unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "network"
    t.string   "card_type"
    t.string   "issuer"
  end

  create_table "carts", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                   unsigned: true
    t.integer  "product_size_id",                           unsigned: true
    t.string   "coupon"
    t.text     "utm_source",      limit: 65535
    t.integer  "device_type",     limit: 1,     default: 0
    t.integer  "quantity",                      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["device_type"], name: "index_carts_on_device_type", using: :btree
    t.index ["user_id", "product_size_id"], name: "index_carts_on_user_id_and_product_size_id", unique: true, using: :btree
  end

  create_table "categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                                                             null: false
    t.string   "title"
    t.text     "description",               limit: 65535
    t.integer  "parent_id"
    t.integer  "status",                    limit: 1,                              default: 1,                  comment: "0=>disable,1=>enable,2=>permanently discontinued"
    t.string   "url"
    t.string   "meta_title"
    t.text     "meta_description",          limit: 65535
    t.text     "meta_keywords",             limit: 65535
    t.integer  "is_outsource",              limit: 1,                              default: 1
    t.string   "is_printed",                limit: 3,                              default: "n"
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.string   "dispatch_days",                                                    default: "7"
    t.string   "canonical_url"
    t.integer  "production_line",           limit: 1,                                                           comment: "1=>Knits,2=>Woven,3=>Fleece,4=>Gift card,5=>Laptop Skin,6=>Mobile Covers"
    t.integer  "factory_outlet_mrp",                                               default: 0,                                                                                                       unsigned: true
    t.integer  "factory_outlet_price",                                             default: 0,                                                                                                       unsigned: true
    t.integer  "shipping_tat_daywise",                                                                                                                                                               unsigned: true
    t.string   "style_code"
    t.string   "size_chart"
    t.string   "cat_type"
    t.string   "subtype"
    t.string   "gender"
    t.string   "subclass"
    t.string   "neck"
    t.string   "sleeve"
    t.string   "material"
    t.string   "fabric"
    t.string   "print_type"
    t.string   "product_length"
    t.string   "fit"
    t.string   "feature1"
    t.string   "feature2"
    t.string   "brand"
    t.string   "model"
    t.string   "operation_trims"
    t.string   "x_factor"
    t.float    "base_mrp",                  limit: 24
    t.string   "inventory_model"
    t.string   "size_range"
    t.string   "printing_set"
    t.string   "y_factor"
    t.integer  "weight_type",                                                      default: 0,                                                                                                       unsigned: true
    t.string   "new_url",                                                          default: ""
    t.string   "styles"
    t.string   "hsn_code"
    t.decimal  "tax_percentage",                          precision: 10, scale: 2, default: "0.0"
    t.decimal  "bunit",                                   precision: 10, scale: 2, default: "0.0"
    t.integer  "url1_id"
    t.integer  "url2_id"
    t.decimal  "costing",                                 precision: 10, scale: 2
    t.float    "cogs",                      limit: 24,                             default: 0.0
    t.integer  "fit_detail_id",                                                                                                                                                                      unsigned: true
    t.string   "alphameric_series",         limit: 3
    t.string   "division"
    t.integer  "url0_id",                                                                                                                                                                            unsigned: true
    t.integer  "boxcode_operation_type",    limit: 1,                              default: 1,                  comment: "0=>category,1=>product"
    t.integer  "lucky_price"
    t.integer  "color_id",                                                                                                                                                                           unsigned: true
    t.float    "all_offer_price",           limit: 24
    t.text     "gpc",                       limit: 65535
    t.text     "availability_weights",      limit: 65535
    t.integer  "production_base_inventory",                                                                                                                                                          unsigned: true
    t.integer  "base_inventory",                                                                                                                                                                     unsigned: true
    t.integer  "bewakoof_branding",                                                default: 0,                                                                                                       unsigned: true
    t.string   "category_target_head"
    t.string   "category_target_class"
    t.integer  "return_period",                                                                                                                                                                      unsigned: true
    t.bigint   "fabric_detail_id",                                                                                                                                                                   unsigned: true
    t.index ["bewakoof_branding"], name: "index_categories_on_bewakoof_branding", using: :btree
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
    t.index ["status"], name: "index_categories_on_status", using: :btree
    t.index ["url"], name: "index_categories_on_url", unique: true, using: :btree
    t.index ["url0_id"], name: "index_categories_on_url0_id", using: :btree
  end

  create_table "category_color_size_mapping", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "id",        default: 0,              unsigned: true
    t.integer "color_id",  default: 0,              unsigned: true
    t.integer "size_id",   default: 0,              unsigned: true
    t.integer "parent_id"
    t.integer "stock_id",  default: 0, null: false
  end

  create_table "category_products_orders", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "category_id",                        default: 0,              unsigned: true
    t.text     "category_product_ids", limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "category_sizes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "category_id", default: 0, unsigned: true
    t.integer  "size_id",     default: 0, unsigned: true
    t.integer  "box_code",    default: 0, unsigned: true
    t.integer  "weight",      default: 0, unsigned: true
    t.integer  "status",      default: 1, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_stylecodes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "category_id",                                        unsigned: true
    t.string   "style_code"
    t.text     "description", limit: 65535
    t.integer  "status",      limit: 1,     default: 1
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["category_id"], name: "index_category_stylecodes_on_category_id", using: :btree
    t.index ["style_code"], name: "index_category_stylecodes_on_style_code", using: :btree
  end

  create_table "cc_communications", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "order_id",                  default: 0,              unsigned: true
    t.integer  "admin_user_id",             default: 0,              unsigned: true
    t.integer  "user_id",                   default: 0,              unsigned: true
    t.string   "message",       limit: 500
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["admin_user_id"], name: "index_cc_communications_on_admin_user_id", using: :btree
    t.index ["order_id"], name: "index_cc_communications_on_order_id", using: :btree
    t.index ["user_id"], name: "index_cc_communications_on_user_id", using: :btree
  end

  create_table "clients", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",         limit: 20
    t.string   "token",        limit: 20
    t.text     "client_token", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["token"], name: "index_clients_on_token", unique: true, using: :btree
  end

  create_table "collection_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id"
    t.integer  "collection_id"
    t.integer  "priority",      default: 0,              unsigned: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "view_date"
    t.index ["collection_id"], name: "index_collection_products_on_collection_id", using: :btree
    t.index ["product_id", "collection_id"], name: "index_collection_products_on_product_id_and_collection_id", unique: true, using: :btree
    t.index ["product_id"], name: "index_collection_products_on_product_id", using: :btree
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                    null: false
    t.string   "url",           limit: 100
    t.text     "details",       limit: 65535
    t.integer  "status",        limit: 1,     default: 1,              comment: "0=>disable,1=>enable"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "canonical_url"
    t.index ["status"], name: "index_collections_on_status", using: :btree
    t.index ["url"], name: "index_collections_on_url", using: :btree
  end

  create_table "color_dups", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "color_name",       limit: 50
    t.text    "group_concat(id)", limit: 65535,                          collation: "utf8_general_ci"
    t.integer "new_id",                         default: 0, null: false
    t.integer "old_id",                         default: 0, null: false
  end

  create_table "colors", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",              limit: 50
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "child_color_name",  limit: 50
    t.string   "parent_color_name", limit: 50
    t.string   "hex_code"
    t.integer  "shade",                                                 unsigned: true
    t.string   "alphameric_series", limit: 3
    t.integer  "category_type",                default: 0,              unsigned: true
    t.index ["name"], name: "index_colors_on_name", unique: true, using: :btree
  end

  create_table "combo_products", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "combo_product_id", default: 0,              unsigned: true
    t.integer  "product_id",       default: 0,              unsigned: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "config_objects", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "object_type",                                 null: false
    t.text     "object_value",   limit: 16777215
    t.integer  "object_version",                  default: 0,              unsigned: true
    t.integer  "status",                          default: 0
    t.string   "comment",        limit: 500
    t.integer  "last_saved_by"
    t.datetime "last_saved_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["object_type"], name: "index_config_objects_on_object_type", using: :btree
  end

  create_table "contact_us", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",        limit: 100,   default: "", null: false
    t.string   "name",         limit: 100
    t.string   "mobile",       limit: 15
    t.integer  "category",                   default: 0,               comment: "0=>Order Status/delivery,1=>Payment & Refund,2=>Return & Replacement, 3=>Cancel or Modify Order, 4=>Account, 5=>Other issues, 6=>Feedback"
    t.text     "sub_category", limit: 65535
    t.string   "subject"
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.string   "order_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["category"], name: "index_contact_us_on_category", using: :btree
    t.index ["email"], name: "index_contact_us_on_email", using: :btree
    t.index ["mobile"], name: "index_contact_us_on_mobile", using: :btree
    t.index ["name"], name: "index_contact_us_on_name", type: :fulltext
    t.index ["sub_category"], name: "index_contact_us_on_sub_category", type: :fulltext
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "message",    limit: 65535
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "counters", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "b_type",                              unsigned: true
    t.integer  "count",      default: 0,              unsigned: true
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                  limit: 50
    t.string   "currency",              limit: 30
    t.string   "currency_code",         limit: 5
    t.string   "map_reference",         limit: 50
    t.string   "internet",              limit: 10
    t.float    "ship_quota",            limit: 24
    t.float    "ship_customer_charges", limit: 24
    t.integer  "ship_owner_charges"
    t.integer  "first_charge"
    t.string   "second_charge"
    t.integer  "status",                limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["status"], name: "index_countries_on_status", using: :btree
  end

  create_table "coupon_campaigns", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                                            unsigned: true
    t.bigint   "order_id",                                                           unsigned: true
    t.string   "code",        limit: 50
    t.integer  "merchant",    limit: 1,  default: 0,              comment: "0=>ola"
    t.datetime "start_date"
    t.datetime "expire_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["code"], name: "index_coupon_campaigns_on_code", using: :btree
    t.index ["user_id", "merchant"], name: "index_coupon_campaigns_on_user_id_and_merchant", unique: true, using: :btree
  end

  create_table "coupon_categories", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "coupon_id",   default: 0,              unsigned: true
    t.integer  "category_id", default: 0,              unsigned: true
    t.boolean  "applicable"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["id"], name: "index_coupon_categories_on_id", using: :btree
  end

  create_table "coupons", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "code",              limit: 50
    t.integer  "category",          limit: 1,                                                       comment: "0=>Percentage,1=>Flat"
    t.decimal  "value",                           precision: 12, scale: 3
    t.integer  "qualifying_amount",                                                                                                                                     unsigned: true
    t.integer  "created_by_id",                                                                                                                                         unsigned: true
    t.integer  "requested_by_id",                                                                                                                                       unsigned: true
    t.datetime "start_date"
    t.datetime "expire_date"
    t.integer  "total_usage",                                                                                                                                           unsigned: true
    t.text     "valid_devices",     limit: 65535
    t.string   "success_message",   limit: 200
    t.string   "coupon_message",    limit: 200
    t.integer  "discount_type",     limit: 1,                              default: 1,              comment: "0=>Cashback,1=>Coupon"
    t.integer  "status",            limit: 1,                                                       comment: "0=>Inactive,1=>Active"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.text     "offer_type",        limit: 65535
    t.integer  "ctype",             limit: 1,                              default: 0,              comment: "0=>normal 1=>internal, 2=>game_campaign, 3=>bulk_coupon"
    t.index ["code"], name: "index_coupons_on_code", using: :btree
    t.index ["created_by_id"], name: "index_coupons_on_created_by_id", using: :btree
    t.index ["requested_by_id"], name: "index_coupons_on_requested_by_id", using: :btree
    t.index ["status"], name: "index_coupons_on_status", using: :btree
  end

  create_table "courier_barcode_images", primary_key: "barcode", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "image_data",    limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "label_details", limit: 65535
  end

  create_table "courier_code_details", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.string   "area_code",    limit: 20,             null: false
    t.string   "routing_code", limit: 20,             null: false
    t.string   "courier_type", limit: 5,              null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["pincode"], name: "index_courier_code_details_on_pincode", using: :btree
  end

  create_table "courier_costs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",                                            default: 0,                  unsigned: true
    t.string   "courier_zone_name", limit: 50
    t.integer  "min_weight",                                            default: 0,                  unsigned: true
    t.integer  "max_weight",                                            default: 0,                  unsigned: true
    t.decimal  "cod_cost",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "prepaid_cost",                 precision: 12, scale: 2, default: "0.0"
    t.decimal  "rto_cost",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "return_cost",                  precision: 12, scale: 2, default: "0.0"
    t.integer  "status",            limit: 1,                           default: 1
    t.datetime "update_on"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.index ["courier_id"], name: "index_courier_costs_on_courier_id", using: :btree
    t.index ["status"], name: "index_courier_costs_on_status", using: :btree
  end

  create_table "courier_locations", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "priority"
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["courier_id"], name: "index_courier_locations_on_courier_id", using: :btree
    t.index ["pincode"], name: "index_courier_locations_on_pincode", using: :btree
    t.index ["status"], name: "index_courier_locations_on_status", using: :btree
  end

  create_table "courier_locations_nov_10", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "priority"
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["courier_id"], name: "index_courier_locations_on_courier_id", using: :btree
    t.index ["pincode"], name: "index_courier_locations_on_pincode", using: :btree
    t.index ["status"], name: "index_courier_locations_on_status", using: :btree
  end

  create_table "courier_locations_nov_12", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "id",                      default: 0, null: false, unsigned: true
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "priority"
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "courier_locations_nov_16", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "id",                      default: 0, null: false, unsigned: true
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "priority"
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "courier_locations_nov_6", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.integer  "status",                  default: 0,              unsigned: true
    t.integer  "priority"
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["courier_id"], name: "index_courier_locations_on_courier_id", using: :btree
    t.index ["pincode"], name: "index_courier_locations_on_pincode", using: :btree
    t.index ["status"], name: "index_courier_locations_on_status", using: :btree
  end

  create_table "courier_services", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "barcode",           limit: 50
    t.bigint   "order_id",                     default: 0, null: false, unsigned: true
    t.integer  "courier_id",                   default: 0, null: false, unsigned: true
    t.integer  "barcode_type",                 default: 0,              unsigned: true
    t.integer  "awb_provider",                 default: 0,              unsigned: true
    t.string   "reference_number"
    t.integer  "qc_process_status",            default: 0,              unsigned: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "status",                       default: 0,              unsigned: true
    t.index ["awb_provider"], name: "index_courier_services_on_awb_provider", using: :btree
    t.index ["barcode", "barcode_type"], name: "index_courier_services_on_barcode_and_barcode_type", unique: true, using: :btree
    t.index ["barcode_type"], name: "index_courier_services_on_barcode_type", using: :btree
    t.index ["courier_id"], name: "index_courier_services_on_courier_id", using: :btree
    t.index ["order_id"], name: "index_courier_services_on_order_id", using: :btree
    t.index ["qc_process_status"], name: "index_courier_services_on_qc_process_status", using: :btree
  end

  create_table "courier_zones", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",                   default: 0,              unsigned: true
    t.integer  "pincode",                      default: 0,              unsigned: true
    t.string   "courier_zone_name", limit: 50
    t.integer  "prepaid",                      default: 0,              unsigned: true
    t.integer  "cod",                          default: 0,              unsigned: true
    t.integer  "reverse",                      default: 0,              unsigned: true
    t.string   "city",              limit: 50
    t.string   "state",             limit: 50
    t.integer  "courier_tat",                  default: 0,              unsigned: true
    t.integer  "status",            limit: 1,  default: 1
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["courier_id"], name: "index_courier_zones_on_courier_id", using: :btree
    t.index ["pincode"], name: "index_courier_zones_on_pincode", using: :btree
    t.index ["status"], name: "index_courier_zones_on_status", using: :btree
  end

  create_table "couriers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                 limit: 50
    t.string   "phone",                limit: 20
    t.string   "tablename",            limit: 50
    t.string   "tracking_link_start",  limit: 300
    t.string   "tracking_link_end",    limit: 300
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "link"
    t.integer  "status",                             default: 0,              unsigned: true
    t.string   "manifest_batch_code"
    t.text     "manifest_email",       limit: 65535
    t.text     "po_email",             limit: 65535
    t.integer  "sap_courier_id",                     default: 0,              unsigned: true
    t.string   "narvar_code",          limit: 50
    t.integer  "batch_code",                         default: 0,              unsigned: true
    t.integer  "courier_index",                      default: 0,              unsigned: true
    t.integer  "clickpost_id",                                                unsigned: true
    t.integer  "reverse_clickpost_id",                                        unsigned: true
    t.integer  "qc_service",                         default: 0,              unsigned: true
    t.string   "display_name",         limit: 50
    t.index ["qc_service"], name: "index_couriers_on_qc_service", using: :btree
  end

  create_table "credit_debit_note_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "credit_debit_note_id",               default: 0,              unsigned: true
    t.integer  "credit_debit_product_id",            default: 0,              unsigned: true
    t.string   "year",                    limit: 10
    t.string   "cd_type",                 limit: 1
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "credit_debit_notes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "credit_debit_note_id",                default: 0,                  unsigned: true
    t.string   "invoice_no",               limit: 20
    t.datetime "invoice_date"
    t.integer  "credit_debit_supplier_id",            default: 0,                  unsigned: true
    t.string   "challan_no",               limit: 30
    t.float    "vat_cst",                  limit: 24,                 null: false
    t.boolean  "is_send",                             default: false
    t.string   "year",                     limit: 10
    t.string   "cd_type",                  limit: 1
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "credit_debit_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "description", limit: 100,             null: false
    t.float    "quantity",    limit: 24
    t.integer  "rate",                    default: 0,              unsigned: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "credit_debit_suppliers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 50,    null: false
    t.text     "address",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "credit_notes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "invoice_no",       default: 0,              unsigned: true
    t.bigint   "credit_note_id",   default: 0, null: false, unsigned: true
    t.string   "credit_note_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["credit_note_type", "credit_note_id"], name: "index_credit_notes_on_credit_note_type_and_credit_note_id", using: :btree
  end

  create_table "deal_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id",                default: 0,              unsigned: true
    t.integer  "deal_id",                   default: 0,              unsigned: true
    t.float    "deal_price",     limit: 24,             null: false
    t.float    "original_price", limit: 24,             null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["deal_id", "product_id"], name: "index_deal_products_on_deal_id_and_product_id", unique: true, using: :btree
    t.index ["deal_id"], name: "index_deal_products_on_deal_id", using: :btree
    t.index ["product_id"], name: "index_deal_products_on_product_id", using: :btree
  end

  create_table "deals", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "object_value", limit: 65535
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name",         limit: 15,                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "deal_type",    limit: 1,     default: 0
    t.index ["deal_type"], name: "index_deals_on_deal_type", using: :btree
    t.index ["end_date"], name: "index_deals_on_end_date", using: :btree
    t.index ["name"], name: "index_deals_on_name", unique: true, using: :btree
    t.index ["start_date"], name: "index_deals_on_start_date", using: :btree
  end

  create_table "debit_note_details", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "debit_note_id",                                           default: 0,                  unsigned: true
    t.integer  "delivery_challan_id",                                     default: 0,                  unsigned: true
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "description"
    t.decimal  "quantity",                       precision: 10, scale: 2, default: "0.0"
    t.decimal  "rate",                           precision: 10, scale: 2, default: "0.0"
    t.float    "tax_value",           limit: 24
    t.index ["debit_note_id"], name: "index_debit_note_details_on_debit_note_id", using: :btree
    t.index ["delivery_challan_id"], name: "index_debit_note_details_on_delivery_challan_id", using: :btree
  end

  create_table "debit_notes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "invoice"
    t.integer  "tax_type",      limit: 1,                          comment: "1=>cst 2=>vat"
    t.datetime "invoice_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "vendor_id",               default: 0,                                        unsigned: true
    t.integer  "admin_user_id",           default: 0,                                        unsigned: true
    t.integer  "status",        limit: 1, default: 0
    t.index ["invoice"], name: "index_debit_notes_on_invoice", using: :btree
  end

  create_table "delete_order_processes_ids", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "id", default: 0, null: false, unsigned: true
  end

  create_table "delivery_challan_details", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "delivery_challan_id", default: 0,              unsigned: true
    t.integer  "order_product_id",    default: 0,              unsigned: true
    t.integer  "return_qty",          default: 0,              unsigned: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["delivery_challan_id"], name: "index_delivery_challan_details_on_delivery_challan_id", using: :btree
    t.index ["order_product_id"], name: "index_delivery_challan_details_on_order_product_id", using: :btree
  end

  create_table "delivery_challans", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bewakoof_challan_id", default: 0,              unsigned: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["bewakoof_challan_id"], name: "index_delivery_challans_on_bewakoof_challan_id", using: :btree
  end

  create_table "designers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",          limit: 100
    t.string   "banner_image",  limit: 200
    t.string   "profile_image", limit: 200
    t.string   "contact",       limit: 15
    t.string   "email",         limit: 100
    t.string   "site_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "bewakoof_url"
    t.text     "about",         limit: 65535
    t.boolean  "enable"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["enable"], name: "index_designers_on_enable", using: :btree
  end

  create_table "designs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "status",                          default: 1
    t.string   "filter_id"
    t.integer  "designer_id",                     default: 67
    t.string   "alphameric_series", limit: 4
    t.string   "gender"
    t.index ["name"], name: "index_designs_on_name", unique: true, using: :btree
  end

  create_table "devices", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "device_id",       limit: 20,              null: false
    t.bigint   "user_id",                                              unsigned: true
    t.datetime "sign_in_at"
    t.string   "registration_id", limit: 500
    t.string   "operators",       limit: 500
    t.string   "model",           limit: 50
    t.string   "manufacturer",    limit: 50
    t.integer  "version",                     default: 0,              unsigned: true
    t.boolean  "status"
    t.integer  "device_type",     limit: 1
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["device_id"], name: "index_devices_on_device_id", using: :btree
    t.index ["device_type"], name: "index_devices_on_device_type", using: :btree
    t.index ["status"], name: "index_devices_on_status", using: :btree
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "duplicate_order_processes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "order_id", default: 0, null: false, unsigned: true
    t.bigint "c",        default: 0, null: false
  end

  create_table "fabric_details", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",        limit: 50
    t.string   "description"
    t.string   "fabric_type", limit: 50
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["fabric_type"], name: "index_fabric_details_on_fabric_type", using: :btree
  end

  create_table "fabric_locations", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "status",        default: 1
    t.integer  "admin_user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "fabric_processes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "bewakoof_lot"
    t.string   "dying_lot"
    t.integer  "fabric_category",                                                           default: 0,              unsigned: true
    t.integer  "fabric_type_id",                                                            default: 0,              unsigned: true
    t.integer  "color_id",                                                                  default: 0,              unsigned: true
    t.integer  "design_id",                                                                 default: 0,              unsigned: true
    t.decimal  "weight",                                           precision: 10, scale: 3
    t.decimal  "dia",                                              precision: 10, scale: 3
    t.decimal  "gsm",                                              precision: 10, scale: 2
    t.string   "remark"
    t.integer  "status",                                                                    default: 0,              unsigned: true
    t.integer  "admin_user_id",                                                             default: 0,              unsigned: true
    t.datetime "created_at",                                                                            null: false
    t.datetime "updated_at",                                                                            null: false
    t.integer  "purchase_order_id",                                                                                  unsigned: true
    t.decimal  "used_weight",                                      precision: 10, scale: 3
    t.string   "parent_bewakoof_lot"
    t.decimal  "length",                                           precision: 10, scale: 3
    t.integer  "goods_receive_number_delivery_challan_id",                                  default: 0,              unsigned: true
    t.integer  "goods_receive_number_delivery_challan_product_id",                          default: 0,              unsigned: true
    t.integer  "fabric_location_id",                                                                                 unsigned: true
    t.index ["status"], name: "index_fabric_processes_on_status", using: :btree
  end

  create_table "fabric_types", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category"
    t.integer  "status"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "factory_outlet_billing_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "factory_outlet_billing_id",                                      default: 0,                  unsigned: true
    t.integer  "factory_outlet_category_id",                                     default: 0,                  unsigned: true
    t.integer  "quantity",                                                       default: 0,                  unsigned: true
    t.float    "price",                      limit: 24
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
    t.decimal  "cgst_amount",                           precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_percentage",                       precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_amount",                           precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_percentage",                       precision: 10, scale: 2, default: "0.0"
    t.decimal  "vat",                                   precision: 10, scale: 2, default: "0.0"
    t.index ["factory_outlet_billing_id"], name: "billing_id_index", using: :btree
    t.index ["factory_outlet_category_id"], name: "index_factory_outlet_billing_products_on_category_id", using: :btree
  end

  create_table "factory_outlet_billings", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "invoice_id",                                                     unsigned: true
    t.integer  "admin_user_id",                                                  unsigned: true
    t.integer  "status",                     limit: 1,  default: 0
    t.datetime "invoice_date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "mode_of_payment",                       default: 0,              unsigned: true
    t.integer  "cash_amount",                           default: 0,              unsigned: true
    t.integer  "factory_outlet_customer_id",            default: 0,              unsigned: true
    t.string   "sap_reference_id",           limit: 50
    t.integer  "location",                              default: 0,              unsigned: true
    t.index ["admin_user_id"], name: "index_factory_outlet_billings_on_admin_user_id", using: :btree
    t.index ["invoice_date"], name: "index_factory_outlet_billings_on_invoice_date", using: :btree
    t.index ["invoice_id"], name: "index_factory_outlet_billings_on_invoice_id", using: :btree
  end

  create_table "factory_outlet_categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "category_id",                                        default: 0,                  unsigned: true
    t.float    "mrp",            limit: 24
    t.float    "price",          limit: 24
    t.integer  "qty_inventory",                                      default: 0,                  unsigned: true
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "out_inventory",                                      default: 0,                  unsigned: true
    t.integer  "is_printed",                                         default: 0,                  unsigned: true
    t.integer  "status",                                             default: 0,                  unsigned: true
    t.string   "hsn_code"
    t.decimal  "tax_percentage",            precision: 10, scale: 2, default: "0.0"
    t.integer  "quantity",                                           default: 1,                  unsigned: true
    t.string   "article_code",   limit: 30
    t.integer  "sap_status",                                         default: 0,                  unsigned: true
    t.index ["category_id"], name: "index_factory_outlet_categories_on_category_id", using: :btree
  end

  create_table "factory_outlet_customers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "customer_name",   limit: 30
    t.string   "customer_vat_no", limit: 30
    t.string   "mobile",          limit: 15
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "customer_code",              default: 0,              unsigned: true
    t.index ["mobile"], name: "index_factory_outlet_customers_on_mobile", using: :btree
  end

  create_table "fanbook_lists", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "product_ids", limit: 100
    t.integer  "priority",                default: 0,                                                unsigned: true
    t.string   "image_name"
    t.integer  "status",                  default: 1,              comment: "1=>enable, 0=>disable", unsigned: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["status"], name: "index_fanbook_lists_on_status", using: :btree
  end

  create_table "fanbooks", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",       default: 0, null: false,                                   unsigned: true
    t.integer  "admin_user_id", default: 0,                                                unsigned: true
    t.integer  "product_id",    default: 0,                                                unsigned: true
    t.datetime "approve_time"
    t.integer  "priority"
    t.integer  "status",                                 comment: "1=>enable, 0=>disable"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["admin_user_id"], name: "index_fanbooks_on_admin_user_id", using: :btree
    t.index ["product_id"], name: "index_fanbooks_on_product_id", using: :btree
    t.index ["status"], name: "index_fanbooks_on_status", using: :btree
    t.index ["user_id"], name: "index_fanbooks_on_user_id", using: :btree
  end

  create_table "feedback_bkp", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "id",                        default: 0,  null: false, unsigned: true
    t.text     "questions",   limit: 65535
    t.string   "mailer_type", limit: 20
    t.integer  "rating",      limit: 1
    t.string   "email",       limit: 100,   default: "", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "feedbacks", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "questions",   limit: 65535
    t.string   "mailer_type", limit: 20
    t.integer  "rating",      limit: 1
    t.string   "email",       limit: 100,   default: "", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "fhm_registered_users", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",      limit: 100,   default: "",  null: false
    t.string   "mobile",     limit: 15
    t.integer  "status",                   default: 0,                unsigned: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "subtype",                  default: "0", null: false
    t.text     "answers",    limit: 65535
    t.string   "name",       limit: 100
    t.index ["email"], name: "index_fhm_registered_users_on_email", using: :btree
    t.index ["mobile"], name: "index_fhm_registered_users_on_mobile", using: :btree
    t.index ["status"], name: "index_fhm_registered_users_on_status", using: :btree
    t.index ["subtype"], name: "index_fhm_registered_users_on_subtype", using: :btree
  end

  create_table "file_uploads", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "upload_type",   limit: 50
    t.string   "file_name"
    t.string   "merchant",      limit: 50
    t.text     "detail",        limit: 65535
    t.string   "file_hash"
    t.integer  "admin_user_id",                                        unsigned: true
    t.integer  "status",                                               unsigned: true
    t.integer  "error",                       default: 0,              unsigned: true
    t.integer  "success",                     default: 0,              unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["upload_type", "file_hash"], name: "index_file_uploads_on_upload_type_and_file_hash", unique: true, using: :btree
  end

  create_table "filter_products", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id", default: 0,              unsigned: true
    t.integer  "filter_id",  default: 0,              unsigned: true
    t.integer  "priority",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["filter_id"], name: "index_filter_products_on_filter_id", using: :btree
    t.index ["priority"], name: "index_filter_products_on_priority", using: :btree
    t.index ["product_id", "filter_id"], name: "index_filter_products_on_product_id_and_filter_id", unique: true, using: :btree
    t.index ["product_id"], name: "index_filter_products_on_product_id", using: :btree
  end

  create_table "filters", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 80
    t.string   "value",      limit: 80
    t.text     "details",    limit: 65535
    t.integer  "status",     limit: 1,     default: 1
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["status"], name: "index_filters_on_status", using: :btree
    t.index ["value"], name: "index_filters_on_value", using: :btree
  end

  create_table "fit_details", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",        limit: 50
    t.string   "description"
    t.string   "fit_type",    limit: 50
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["fit_type"], name: "index_fit_details_on_fit_type", using: :btree
  end

  create_table "frame_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "frame_id",    default: 0,                 unsigned: true
    t.integer  "product_id",  default: 0,                 unsigned: true
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "category_id"
    t.index ["frame_id"], name: "index_frame_products_on_frame_id", using: :btree
    t.index ["product_id"], name: "index_frame_products_on_product_id", using: :btree
  end

  create_table "frames", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "color_name",                null: false
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "design_id"
  end

  create_table "fraud_customers", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",   default: 0, null: false, unsigned: true
    t.bigint   "user_id",    default: 0, null: false, unsigned: true
    t.string   "reason"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["order_id"], name: "index_fraud_customers_on_order_id", using: :btree
    t.index ["user_id"], name: "index_fraud_customers_on_user_id", using: :btree
  end

  create_table "freebies", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 100
    t.integer  "quantity",                                          default: 0,              unsigned: true
    t.decimal  "weight",                   precision: 10, scale: 3
    t.integer  "status",                                            default: 0,              unsigned: true
    t.text     "box_codes",  limit: 65535
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "gender",                                            default: 0,              unsigned: true
  end

  create_table "game_campaigns", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "mobile",         limit: 10
    t.integer  "coupon_id",                                                                          unsigned: true
    t.integer  "used_status",    limit: 1,  default: 0,              comment: "0=>not used,1=>used"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "campaign_title"
    t.index ["mobile", "campaign_title"], name: "index_game_campaigns_on_mobile_and_campaign_title", unique: true, using: :btree
  end

  create_table "gift_cards", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "code_type"
    t.integer  "product_size_id"
    t.string   "token_id",        limit: 100
    t.integer  "order_id"
    t.integer  "status",          limit: 1,                               comment: "0=>Inactive,1=>Active,2=>credited"
    t.text     "details",         limit: 65535
    t.string   "from_email",      limit: 100,   default: ""
    t.string   "to_email",        limit: 100,   default: "", null: false
    t.datetime "start_date"
    t.datetime "expire_date"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["from_email"], name: "index_gift_cards_on_from_email", using: :btree
    t.index ["order_id"], name: "index_gift_cards_on_order_id", using: :btree
    t.index ["product_size_id"], name: "index_gift_cards_on_product_size_id", using: :btree
    t.index ["status"], name: "index_gift_cards_on_status", using: :btree
    t.index ["to_email"], name: "index_gift_cards_on_to_email", using: :btree
    t.index ["token_id"], name: "index_gift_cards_on_token_id", using: :btree
  end

  create_table "gojavas", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "area_code",    limit: 30
    t.integer "pincode"
    t.string  "routing_code", limit: 30
    t.index ["pincode"], name: "pincode", using: :btree
  end

  create_table "gross_margin_categories", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "category",                                           null: false
    t.float    "gross_sales",               limit: 24, default: 0.0, null: false
    t.float    "promotional_wallet",        limit: 24, default: 0.0, null: false
    t.float    "product_gs",                limit: 24, default: 0.0, null: false
    t.float    "service_gs",                limit: 24, default: 0.0, null: false
    t.float    "es_cancel",                 limit: 24, default: 0.0, null: false
    t.float    "es_rto",                    limit: 24, default: 0.0, null: false
    t.float    "es_returned",               limit: 24, default: 0.0, null: false
    t.float    "cogs",                      limit: 24, default: 0.0, null: false
    t.float    "net_cogs",                  limit: 24, default: 0.0, null: false
    t.float    "freight_charges",           limit: 24, default: 0.0, null: false
    t.float    "cash_collection",           limit: 24, default: 0.0, null: false
    t.float    "logistic_cost",             limit: 24, default: 0.0, null: false
    t.float    "net_sales",                 limit: 24, default: 0.0, null: false
    t.float    "gross_margin",              limit: 24, default: 0.0, null: false
    t.float    "gst",                       limit: 24, default: 0.0, null: false
    t.date     "added_date",                                         null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.float    "gross_margin_contribution", limit: 24, default: 0.0
    t.index ["added_date", "category"], name: "index_gross_margin_categories_on_added_date_and_category", unique: true, using: :btree
  end

  create_table "groups", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.text     "additional_emails", limit: 65535
    t.integer  "created_by",                      default: 0, unsigned: true
    t.integer  "updated_by",                      default: 0, unsigned: true
    t.integer  "status",                          default: 0, unsigned: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_carts", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_size_id",                           unsigned: true
    t.text     "token_id",        limit: 65535
    t.integer  "quantity",                      default: 1
    t.integer  "device_type",     limit: 1,     default: 0
    t.string   "coupon"
    t.text     "utm_source",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["device_type"], name: "index_guest_carts_on_device_type", using: :btree
    t.index ["product_size_id"], name: "index_guest_carts_on_product_size_id", using: :btree
  end

  create_table "image_tags", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 20
    t.integer  "image_id"
    t.integer  "product_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["image_id"], name: "index_image_tags_on_image_id", using: :btree
    t.index ["product_id", "name", "image_id"], name: "index_image_tags_on_product_id_and_name_and_image_id", unique: true, using: :btree
  end

  create_table "images", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "alt_tag"
    t.text     "details",            limit: 65535
    t.integer  "priority",                         default: 0,              unsigned: true
    t.integer  "sub_type",                         default: 0,              unsigned: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "status",                           default: 1,              unsigned: true
    t.integer  "sub_class",                                                 unsigned: true
    t.string   "height",             limit: 10
    t.string   "width",              limit: 10
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "images_bkp", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "alt_tag"
    t.text     "details",            limit: 65535
    t.integer  "priority",                         default: 0,              unsigned: true
    t.integer  "sub_type",                         default: 0,              unsigned: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "status",                           default: 1,              unsigned: true
    t.integer  "sub_class",                                                 unsigned: true
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "leads", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email"
    t.boolean  "status",                   default: true
    t.text     "details",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_leads_on_email", using: :btree
    t.index ["id"], name: "index_leads_on_id", using: :btree
  end

  create_table "links", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "controller", limit: 50
    t.string   "action",     limit: 40
    t.text     "purpose",    limit: 65535
    t.string   "department", limit: 40
    t.integer  "status",     limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["controller", "action"], name: "index_links_on_controller_and_action", using: :btree
    t.index ["status"], name: "index_links_on_status", using: :btree
  end

  create_table "locations", primary_key: "pincode", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "city",         limit: 50
    t.string   "state",        limit: 50
    t.integer  "country_id",              default: 0,              unsigned: true
    t.string   "country_name", limit: 50
    t.integer  "status",       limit: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["country_id"], name: "index_locations_on_country_id", using: :btree
    t.index ["status"], name: "index_locations_on_status", using: :btree
  end

  create_table "mailer_questions", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "question_type",         limit: 65535
    t.text     "default_question",      limit: 65535
    t.integer  "days",                                                         unsigned: true
    t.integer  "order_status",                                                 unsigned: true
    t.integer  "priority",                                                     unsigned: true
    t.integer  "status",                              default: 0,              unsigned: true
    t.text     "rating_0",              limit: 65535
    t.text     "rating_1",              limit: 65535
    t.text     "rating_2",              limit: 65535
    t.text     "rating_3",              limit: 65535
    t.text     "rating_4",              limit: 65535
    t.text     "rating_5",              limit: 65535
    t.text     "rating_6",              limit: 65535
    t.text     "rating_7",              limit: 65535
    t.text     "rating_8",              limit: 65535
    t.text     "rating_9",              limit: 65535
    t.text     "rating_10",             limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.text     "email_details",         limit: 65535
    t.integer  "display_order_details",               default: 0,              unsigned: true
    t.string   "range_details"
    t.index ["days"], name: "index_mailer_questions_on_days", using: :btree
    t.index ["order_status"], name: "index_mailer_questions_on_order_status", using: :btree
    t.index ["priority"], name: "index_mailer_questions_on_priority", using: :btree
    t.index ["status"], name: "index_mailer_questions_on_status", using: :btree
  end

  create_table "mailer_sms_logs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "mailer_log", limit: 65535
    t.text     "sms_log",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "manifests", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",                    default: 0,              unsigned: true
    t.bigint   "order_id",                      default: 0, null: false, unsigned: true
    t.float    "collectable_amount", limit: 24
    t.float    "total_amount",       limit: 24
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["courier_id"], name: "index_manifests_on_courier_id", using: :btree
    t.index ["order_id"], name: "index_manifests_on_order_id", using: :btree
  end

  create_table "manual_sorted_products", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_id", default: 0, unsigned: true
    t.bigint  "url_id"
    t.integer "position"
    t.index ["position"], name: "index_manual_sorted_products_on_position", using: :btree
    t.index ["product_id"], name: "index_manual_sorted_products_on_product_id", using: :btree
    t.index ["url_id"], name: "index_manual_sorted_products_on_url_id", using: :btree
  end

  create_table "marketing_expenses", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",               default: 0,   null: false, unsigned: true
    t.float    "amount",     limit: 24, default: 0.0
    t.string   "remarks"
    t.integer  "validity",              default: 0,                unsigned: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_marketing_expenses_on_user_id", using: :btree
  end

  create_table "marketplace_order_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "marketplace_order_id", default: 0,              unsigned: true
    t.integer  "product_size_id",      default: 0,              unsigned: true
    t.integer  "required_quantity",    default: 0,              unsigned: true
    t.integer  "ordered_quantity",     default: 0,              unsigned: true
    t.integer  "printing_quantity",    default: 0,              unsigned: true
    t.integer  "fulfilled_quantity",   default: 0,              unsigned: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["marketplace_order_id"], name: "index_marketplace_order_products_on_marketplace_order_id", using: :btree
    t.index ["product_size_id"], name: "index_marketplace_order_products_on_product_size_id", using: :btree
  end

  create_table "marketplace_orders", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "status",         default: 0,              unsigned: true
    t.integer  "marketplace_id", default: 0,              unsigned: true
    t.integer  "admin_user_id",  default: 0,              unsigned: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["marketplace_id"], name: "index_marketplace_orders_on_marketplace_id", using: :btree
    t.index ["status"], name: "index_marketplace_orders_on_status", using: :btree
  end

  create_table "marketplaces", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 30
    t.integer  "status",                default: 0,              unsigned: true
    t.string   "code",       limit: 3
    t.integer  "place_type",            default: 0,              unsigned: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "memberships", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                                 unsigned: true
    t.datetime "start_date",                                 null: false
    t.datetime "end_date",                                   null: false
    t.decimal  "price",           precision: 10, default: 0
    t.boolean  "status"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "product_size_id",                                         unsigned: true
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "mobile_numbers", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "mobile", limit: 15
    t.integer "status", limit: 2
    t.index ["mobile"], name: "index_mobile_numbers_on_mobile", unique: true, using: :btree
  end

  create_table "models", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name",     limit: 40
    t.string   "last_name",      limit: 40
    t.string   "height",         limit: 5
    t.integer  "size_top_id",    limit: 1
    t.integer  "size_bottom_id", limit: 1
    t.integer  "gender",         limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "chest_or_bust",  limit: 5
    t.string   "waist",          limit: 5
    t.string   "hips",           limit: 5
    t.integer  "age",            limit: 2
  end

  create_table "multiple_color_groups", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "child_category_id", default: 0,              unsigned: true
    t.integer  "design_id",         default: 0,              unsigned: true
    t.integer  "product_id",        default: 0,              unsigned: true
    t.integer  "priority",          default: 0,              unsigned: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["child_category_id", "design_id", "product_id"], name: "uniq_index", unique: true, using: :btree
  end

  create_table "offers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",    default: 0, null: false, unsigned: true
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_offers_on_user_id", using: :btree
  end

  create_table "old_refunds_date", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "id",                         default: 0,     null: false,                                                                                                      unsigned: true
    t.integer  "order_id",                   default: 0,                                                                                                                       unsigned: true
    t.integer  "order_product_id",                                                                                                                                             unsigned: true
    t.integer  "wallet_id",                                                                                                                                                    unsigned: true
    t.integer  "address_id",                                                                                                                                                   unsigned: true
    t.integer  "product_size_id",                                                                                                                                              unsigned: true
    t.integer  "quantity",                                                                                                                                                     unsigned: true
    t.integer  "status",           limit: 1, default: 0,                  comment: "Request Placed=>0,Pickup requested=>1,Intransit=>2,Received=>3 ,Products Not Received=>4"
    t.string   "reason"
    t.string   "note"
    t.integer  "courier_id",                 default: 0,                                                                                                                       unsigned: true
    t.boolean  "self_shipped",               default: false,              comment: "Yes=>1, No=>0"
    t.datetime "receive_date"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "order_cancel_requests", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                                    default: 0,     null: false,                                                                      unsigned: true
    t.text     "cancel_reason",        limit: 65535
    t.integer  "from_wallet",                                                 default: 0,                                                                                       unsigned: true
    t.integer  "mail_delivery_status",                                        default: 0,                                                                                       unsigned: true
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.integer  "status",                                                      default: 0,                  comment: "0=>cancellation_requested 1=>mail_delivered 2=>cancelled", unsigned: true
    t.integer  "device",                                                                                                                                                        unsigned: true
    t.integer  "request_type",                                                default: 0,                  comment: "0=>cancel 1=>address 2=>size",                             unsigned: true
    t.decimal  "extra_credits",                      precision: 12, scale: 3, default: "0.0"
    t.index ["from_wallet"], name: "index_order_cancel_requests_on_from_wallet", using: :btree
    t.index ["mail_delivery_status"], name: "index_order_cancel_requests_on_mail_delivery_status", using: :btree
    t.index ["order_id", "request_type"], name: "index_order_cancel_requests_on_order_id_and_request_type", unique: true, using: :btree
  end

  create_table "order_cashback_coupons", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                           default: 0, null: false, unsigned: true
    t.integer  "coupon_id",                          default: 0,              unsigned: true
    t.float    "with_wallet_cashback",    limit: 24
    t.float    "without_wallet_cashback", limit: 24
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["coupon_id"], name: "index_order_cashback_coupons_on_coupon_id", using: :btree
    t.index ["order_id"], name: "index_order_cashback_coupons_on_order_id", using: :btree
  end

  create_table "order_courier_cost_estimations", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                              default: 0,     null: false, unsigned: true
    t.decimal  "cod_cost",     precision: 12, scale: 2, default: "0.0"
    t.decimal  "prepaid_cost", precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["order_id"], name: "index_order_courier_cost_estimations_on_order_id", unique: true, using: :btree
  end

  create_table "order_courier_costs", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                              default: 0,     null: false, unsigned: true
    t.decimal  "cod_cost",     precision: 12, scale: 2, default: "0.0"
    t.decimal  "prepaid_cost", precision: 12, scale: 2, default: "0.0"
    t.decimal  "rto_cost",     precision: 12, scale: 2, default: "0.0"
    t.decimal  "return_cost",  precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["order_id"], name: "index_order_courier_costs_on_order_id", unique: true, using: :btree
  end

  create_table "order_deductions", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_product_id",            default: 0, null: false, unsigned: true
    t.float    "amount",           limit: 24
    t.integer  "coupon_id",                   default: 0,              unsigned: true
    t.integer  "deduct_type",      limit: 1,              null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["coupon_id"], name: "index_order_deductions_on_coupon_id", using: :btree
    t.index ["deduct_type"], name: "index_order_deductions_on_deduct_type", using: :btree
    t.index ["order_product_id"], name: "index_order_deductions_on_order_product_id", using: :btree
  end

  create_table "order_invoices", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "order_id",                                        default: 0,                  unsigned: true
    t.decimal  "discount",               precision: 12, scale: 2, default: "0.0"
    t.decimal  "rate_exclusive_tax",     precision: 12, scale: 2, default: "0.0"
    t.decimal  "cod_exclusive_tax",      precision: 12, scale: 2, default: "0.0"
    t.decimal  "shipping_exclusive_tax", precision: 12, scale: 2, default: "0.0"
    t.decimal  "sub_total",              precision: 12, scale: 2, default: "0.0"
    t.decimal  "net_payable",            precision: 12, scale: 2, default: "0.0"
    t.decimal  "collectable_amount",     precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.index ["order_id"], name: "index_order_invoices_on_order_id", using: :btree
  end

  create_table "order_processes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                  default: 0, null: false,                                                                                                  unsigned: true
    t.string   "barcode",                     limit: 50
    t.integer  "courier_id",                                                                                                                                                          unsigned: true
    t.text     "rto_reason",                  limit: 65535
    t.datetime "packing_date"
    t.datetime "shipping_date"
    t.datetime "delivered_date"
    t.datetime "rto_date"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "batch_code",                                default: 0,                                                                                                               unsigned: true
    t.datetime "rto_initiated_date"
    t.datetime "cod_collected_at"
    t.datetime "first_out_for_delivery_date"
    t.integer  "out_for_delivery_attempts",                 default: 0,                                                                                                               unsigned: true
    t.integer  "status",                                    default: 0
    t.datetime "ready_to_ship_date"
    t.integer  "ready_to_ship_status",                      default: 0,                                                                                                               unsigned: true
    t.integer  "tracking_provider_status_id",               default: 0,                                                                                                               unsigned: true
    t.integer  "courier_data_status",                       default: 0,                                                                                                               unsigned: true
    t.integer  "rto_refund_option",                                                  comment: "0=>wallet 1=>payu 2=>paytm 3=>mobikwik 4=>amazonpay 5=>phonepe 6=>razorpay 7=>paypal", unsigned: true
    t.datetime "received_in_pod_date"
    t.integer  "clickpost_data_status",                     default: 0,                                                                                                               unsigned: true
    t.index ["barcode"], name: "index_order_processes_on_barcode", unique: true, using: :btree
    t.index ["courier_id", "batch_code"], name: "index_order_processes_on_courier_id_and_batch_code", using: :btree
    t.index ["courier_id"], name: "index_order_processes_on_courier_id", using: :btree
    t.index ["order_id"], name: "uniq_index", unique: true, using: :btree
    t.index ["packing_date"], name: "index_order_processes_on_packing_date", using: :btree
    t.index ["rto_date"], name: "index_order_processes_on_rto_date", using: :btree
    t.index ["shipping_date"], name: "index_order_processes_on_shipping_date", using: :btree
  end

  create_table "order_product_inventory_details", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_product_id",            default: 0, null: false,                                                unsigned: true
    t.integer  "quantity",                    default: 0,                                                             unsigned: true
    t.integer  "base_inventory",    limit: 1, default: 0, null: false, comment: "0=>unlimited,1=>color,2=>inventory"
    t.integer  "qty_avail",                   default: 0,                                                             unsigned: true
    t.integer  "qty_inventory",               default: 0,                                                             unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "ok_stock_quantity",           default: 0,                                                             unsigned: true
    t.integer  "qty_printing",                default: 0,                                                             unsigned: true
    t.integer  "quantity_freeze",             default: 0,                                                             unsigned: true
    t.index ["order_product_id"], name: "index_order_product_inventory_details_on_order_product_id", unique: true, using: :btree
  end

  create_table "order_products", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                             default: 0,     null: false,                                                                                                            unsigned: true
    t.integer  "product_size_id",                                      default: 0,                                                                                                                             unsigned: true
    t.integer  "quantity",                                             default: 0,                                                                                                                             unsigned: true
    t.float    "price",            limit: 24
    t.datetime "dispatched_at"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.decimal  "excise",                      precision: 10, scale: 2, default: "0.0"
    t.decimal  "vat",                         precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_amount",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_percentage",             precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_amount",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_percentage",             precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_amount",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_percentage",             precision: 10, scale: 2, default: "0.0"
    t.integer  "offer_type",       limit: 2,                                                        comment: "0=>all_offer, 1=>factory_outlet_price, 2=>dotd, 3=>basics, 4=>price_cut, 5=>gift_card, 6=>cotm"
    t.integer  "base_inventory",   limit: 1,                                                        comment: "0=>unlimited,1=>color,2=>inventory"
    t.boolean  "is_loyalty_order",                                     default: false
    t.float    "original_price",   limit: 24,                          default: 0.0
    t.index ["base_inventory"], name: "index_order_products_on_base_inventory", using: :btree
    t.index ["order_id"], name: "index_order_products_on_order_id", using: :btree
    t.index ["product_size_id"], name: "index_order_products_on_product_size_id", using: :btree
  end

  create_table "order_refund_status", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "id",                     default: 0,     null: false,                                                                                                      unsigned: true
    t.integer  "order_id",               default: 0,                                                                                                                       unsigned: true
    t.integer  "status",       limit: 1, default: 0,                  comment: "Request Placed=>0,Pickup requested=>1,Intransit=>2,Received=>3 ,Products Not Received=>4"
    t.datetime "updated_at",                             null: false
    t.integer  "courier_id",             default: 0,                                                                                                                       unsigned: true
    t.boolean  "self_shipped",           default: false,              comment: "Yes=>1, No=>0"
  end

  create_table "order_refunds", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "order_id",                            default: 0,                                                                                                                       unsigned: true
    t.integer  "order_product_id",                                                                                                                                                      unsigned: true
    t.integer  "wallet_id",                                                                                                                                                             unsigned: true
    t.integer  "address_id",                                                                                                                                                            unsigned: true
    t.integer  "product_size_id",                                                                                                                                                       unsigned: true
    t.integer  "quantity",                                                                                                                                                              unsigned: true
    t.integer  "status",                limit: 1,     default: 0,                  comment: "Request Placed=>0,Pickup requested=>1,Intransit=>2,Received=>3 ,Products Not Received=>4"
    t.integer  "qc_service_status",                   default: 0,                                                                                                                       unsigned: true
    t.integer  "qc_process_status",                   default: 0,                                                                                                                       unsigned: true
    t.integer  "clickpost_data_status",               default: 0,                                                                                                                       unsigned: true
    t.string   "reason"
    t.text     "note",                  limit: 65535
    t.integer  "courier_id",                          default: 0,                                                                                                                       unsigned: true
    t.boolean  "self_shipped",                        default: false,              comment: "Yes=>1, No=>0"
    t.datetime "receive_date"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "barcode",               limit: 50
    t.integer  "reason_check"
    t.text     "admin_comment",         limit: 65535
    t.text     "sub_reason",            limit: 65535
    t.integer  "refund_option",                       default: 0,                  comment: "0=>wallet 1=>neft 2=>payu 3=>paytm 4=>mobikwik",                                           unsigned: true
    t.integer  "refund_from_status",                  default: 0,                  comment: "0=>default 1=>request_cancel_to_received",                                                 unsigned: true
    t.integer  "self_ship_amount",                                                                                                                                                      unsigned: true
    t.integer  "wrong_product_status"
    t.integer  "returned_by",                         default: 0
    t.datetime "intransit_date"
    t.index ["address_id"], name: "index_order_refunds_on_address_id", using: :btree
    t.index ["barcode"], name: "index_order_refunds_on_barcode", unique: true, using: :btree
    t.index ["courier_id"], name: "index_order_refunds_on_courier_id", using: :btree
    t.index ["order_id"], name: "index_order_refunds_on_order_id", using: :btree
    t.index ["order_product_id"], name: "index_order_refunds_on_order_product_id", unique: true, using: :btree
    t.index ["product_size_id"], name: "index_order_refunds_on_product_size_id", using: :btree
    t.index ["qc_process_status"], name: "index_order_refunds_on_qc_process_status", using: :btree
    t.index ["qc_service_status"], name: "index_order_refunds_on_qc_service_status", using: :btree
    t.index ["status"], name: "index_order_refunds_on_status", using: :btree
    t.index ["wallet_id"], name: "index_order_refunds_on_wallet_id", using: :btree
  end

  create_table "order_services", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "serviceable_id",                default: 0,   null: false,                                                   unsigned: true
    t.string   "serviceable_type",   limit: 50
    t.bigint   "service_id",                    default: 0,   null: false,                                                   unsigned: true
    t.float    "charges",            limit: 24,               null: false
    t.integer  "fulfilment_status",             default: 0,                comment: "0=>initiate 1=>complete 3=>incomplete", unsigned: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "additional_charges", limit: 24, default: 0.0, null: false
    t.index ["serviceable_id", "serviceable_type", "service_id"], name: "index_serviceable_service_id", unique: true, using: :btree
  end

  create_table "order_tags", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "name",                                            unsigned: true
    t.bigint   "order_id",               default: 0, null: false, unsigned: true
    t.bigint   "user_id",                default: 0, null: false, unsigned: true
    t.string   "reason",     limit: 100
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "department", limit: 50
    t.index ["name", "order_id"], name: "index_order_tags_on_name_and_order_id", unique: true, using: :btree
    t.index ["order_id"], name: "index_order_tags_on_order_id", using: :btree
    t.index ["user_id"], name: "index_order_tags_on_user_id", using: :btree
  end

  create_table "order_taxes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "o_tax_id",                                                     default: 0,     null: false, unsigned: true
    t.string   "o_tax_type",               limit: 50
    t.decimal  "igst_amount",                         precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_percentage",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_amount",                         precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_percentage",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_amount",                         precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_percentage",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_igst_amount",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_igst_percentage",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_cgst_amount",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_cgst_percentage",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_sgst_amount",                     precision: 10, scale: 2, default: "0.0"
    t.decimal  "cod_sgst_percentage",                 precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_igst_amount",                precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_igst_percentage",            precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_cgst_amount",                precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_cgst_percentage",            precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_sgst_amount",                precision: 10, scale: 2, default: "0.0"
    t.decimal  "shipping_sgst_percentage",            precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.index ["o_tax_id", "o_tax_type"], name: "index_order_taxes_on_o_tax_id_and_o_tax_type", unique: true, using: :btree
    t.index ["o_tax_id"], name: "index_order_taxes_on_o_tax_id", using: :btree
  end

  create_table "order_timelines", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                       default: 0,        null: false, unsigned: true
    t.datetime "expected_shipping_date"
    t.datetime "expected_delivery_date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "shipping_tat_daywise",           default: 0,                     unsigned: true
    t.integer  "delivery_tat_daywise",           default: 0,                     unsigned: true
    t.datetime "updated_expected_delivery_date"
    t.string   "status",                         default: "ontime"
    t.integer  "delivery_delay",                 default: 0,                     unsigned: true
    t.index ["expected_delivery_date"], name: "index_order_timelines_on_expected_delivery_date", using: :btree
    t.index ["expected_shipping_date"], name: "index_order_timelines_on_expected_shipping_date", using: :btree
    t.index ["order_id"], name: "index_order_timelines_on_order_id", unique: true, using: :btree
  end

  create_table "order_wise_payment_details", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                 default: 0, null: false, unsigned: true
    t.string   "merchant",     limit: 100,             null: false
    t.string   "payment_mode", limit: 100,             null: false
    t.string   "issuing_bank", limit: 50
    t.float    "txn_amount",   limit: 24
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["merchant"], name: "index_order_wise_payment_details_on_merchant", using: :btree
    t.index ["order_id"], name: "index_order_wise_payment_details_on_order_id", unique: true, using: :btree
  end

  create_table "orders", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "parent_id",                               default: 0,     null: false,                                                                  unsigned: true
    t.integer  "address_id",                                                                                                                            unsigned: true
    t.bigint   "user_id",                                 default: 0,     null: false,                                                                  unsigned: true
    t.float    "cod_money",                 limit: 24,    default: 0.0,   null: false
    t.float    "shipping_money",            limit: 24,    default: 0.0,   null: false
    t.date     "due_date"
    t.integer  "device_type",                             default: 0,                                                                                   unsigned: true
    t.boolean  "retailer"
    t.integer  "status",                                                                                                                                unsigned: true
    t.boolean  "is_confirm",                              default: false
    t.datetime "confirm_date"
    t.integer  "payment_gateway"
    t.text     "packing_note",              limit: 65535
    t.integer  "admin_user_id",                           default: 0,                                                                                   unsigned: true
    t.datetime "note_last_updated"
    t.integer  "invoice_no",                                                                                                                            unsigned: true
    t.date     "invoice_date"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "packing_type",                            default: 0,                  comment: "0=>not-printed 1=>inventory 2=>printing 3=>processed", unsigned: true
    t.datetime "printed_at"
    t.integer  "sub_status",                              default: 0,                                                                                   unsigned: true
    t.integer  "purchase_order_product_id",                                                                                                             unsigned: true
    t.integer  "freebie_id",                                                                                                                            unsigned: true
    t.datetime "success_date"
    t.integer  "pwb_flag",                  limit: 1,     default: 0,                  comment: "0=>not_assigned,1=>assigned"
    t.integer  "primary_gateway"
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["device_type"], name: "index_orders_on_device_type", using: :btree
    t.index ["is_confirm"], name: "index_orders_on_is_confirm", using: :btree
    t.index ["parent_id"], name: "index_orders_on_parent_id", using: :btree
    t.index ["pwb_flag"], name: "index_orders_on_pwb_flag", using: :btree
    t.index ["retailer", "status", "created_at"], name: "index_orders_on_retailer_and_status_and_created_at", using: :btree
    t.index ["retailer"], name: "index_orders_on_retailer", using: :btree
    t.index ["status", "is_confirm"], name: "index_orders_on_status_and_is_confirm", using: :btree
    t.index ["status"], name: "index_orders_on_status", using: :btree
    t.index ["success_date"], name: "index_orders_on_success_date", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "panel_states", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "state_name",  limit: 80
    t.text     "description", limit: 65535
    t.string   "department",  limit: 30
    t.integer  "domain",                    default: 0,              unsigned: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "panel_type",                default: 0
    t.integer  "location",                  default: 0,              unsigned: true
    t.index ["state_name"], name: "index_panel_states_on_state_name", using: :btree
  end

  create_table "payu_refunds", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                      default: 0,   null: false,                                          unsigned: true
    t.bigint   "parent_id",                     default: 0,   null: false,                                          unsigned: true
    t.bigint   "user_id",                       default: 0,   null: false,                                          unsigned: true
    t.integer  "amount"
    t.string   "transaction_id",  limit: 100
    t.string   "request_id",      limit: 100
    t.integer  "merchant_status"
    t.text     "response_json",   limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "merchant",                      default: 0,                comment: "0=>payu 1=>paytm 2=>mobikwik", unsigned: true
    t.float    "wallet_debit",    limit: 24,    default: 0.0
    t.index ["merchant_status", "order_id"], name: "index_payu_refunds_on_merchant_status_and_order_id", unique: true, using: :btree
    t.index ["request_id"], name: "index_payu_refunds_on_request_id", using: :btree
    t.index ["transaction_id"], name: "index_payu_refunds_on_transaction_id", using: :btree
  end

  create_table "permissions", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "granted_to_id",           default: 0, null: false, unsigned: true
    t.integer  "link_id",                 default: 0,              unsigned: true
    t.bigint   "granted_by_id",           default: 0, null: false, unsigned: true
    t.integer  "access_type",   limit: 1
    t.integer  "status",        limit: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["granted_by_id"], name: "index_permissions_on_granted_by_id", using: :btree
    t.index ["granted_to_id"], name: "index_permissions_on_granted_to_id", using: :btree
    t.index ["link_id"], name: "index_permissions_on_link_id", using: :btree
  end

  create_table "pg_cost_masters", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "merchant",     limit: 50
    t.string   "payment_mode", limit: 50
    t.string   "issuing_bank", limit: 50
    t.decimal  "min_price",               precision: 12, scale: 2, default: "0.0"
    t.decimal  "max_price",               precision: 12, scale: 2, default: "0.0"
    t.decimal  "fee",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "tax",                     precision: 12, scale: 2, default: "0.0"
    t.integer  "status",       limit: 1,                           default: 0,                  comment: "0=>inactive,1=>active,2=>future"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.index ["issuing_bank"], name: "index_pg_cost_masters_on_issuing_bank", using: :btree
    t.index ["payment_mode"], name: "index_pg_cost_masters_on_payment_mode", using: :btree
    t.index ["status"], name: "index_pg_cost_masters_on_status", using: :btree
  end

  create_table "pg_customers", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "customer_id", limit: 65535
    t.bigint   "user_id",                   default: 0, null: false, unsigned: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_pg_customers_on_user_id", using: :btree
  end

  create_table "pg_linked_accounts", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                      unsigned: true
    t.string   "payment_gateway"
    t.string   "token"
    t.date     "expiry"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "token_type"
    t.string   "refresh_token"
    t.index ["user_id"], name: "index_pg_linked_accounts_on_user_id", using: :btree
  end

  create_table "picklist_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "article_code"
    t.integer  "quantity",                             default: 0
    t.integer  "confirmed_qty",                        default: 0
    t.integer  "status"
    t.string   "production_order_id"
    t.integer  "picklist_id"
    t.integer  "qty_forinventory",                     default: 0
    t.integer  "integer",                              default: 0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "sap_sent_quantity",                    default: 0,              unsigned: true
    t.integer  "sap_confirmed_quantity",               default: 0,              unsigned: true
    t.integer  "product_size_id",                      default: 0,              unsigned: true
    t.text     "sap_remark",             limit: 65535
    t.integer  "sap_resend_indicator",                                          unsigned: true
    t.text     "response",               limit: 65535
    t.integer  "short_quantity",                                                unsigned: true
    t.integer  "sap_short_quantity",                                            unsigned: true
    t.index ["article_code"], name: "index_picklist_products_on_article_code", using: :btree
    t.index ["picklist_id"], name: "index_picklist_products_on_picklist_id", using: :btree
  end

  create_table "picklists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "plant"
    t.integer  "picklist_type"
    t.integer  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "admin_user_id", default: 0,              unsigned: true
  end

  create_table "piece_wise_barcodes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "barcode",          limit: 30,             null: false
    t.bigint   "order_id",                                                                                                                   unsigned: true
    t.integer  "product_size_id",             default: 0,                                                                                    unsigned: true
    t.integer  "bin_id",                                                                                                                     unsigned: true
    t.integer  "panel_state_id",                                                                                                             unsigned: true
    t.integer  "origin",                                                                                                                     unsigned: true
    t.string   "sf_barcode",       limit: 30
    t.integer  "inventory_status",            default: 0,                                                                                    unsigned: true
    t.integer  "status",                      default: 0,                                                                                    unsigned: true
    t.integer  "reprint_count",               default: 0,                                                                                    unsigned: true
    t.integer  "life_cycle_count",            default: 0,                                                                                    unsigned: true
    t.integer  "modified_by",                             null: false,                                                                       unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "pickable",                    default: 0,              comment: "0=>not_pickable,1=>picked,2=>inpicklist,3=>not_applicable", unsigned: true
    t.datetime "pickable_at"
    t.datetime "stock_up_date"
    t.index ["barcode"], name: "index_piece_wise_barcodes_on_barcode", unique: true, using: :btree
    t.index ["bin_id"], name: "index_piece_wise_barcodes_on_bin_id", using: :btree
    t.index ["inventory_status"], name: "index_piece_wise_barcodes_on_inventory_status", using: :btree
    t.index ["modified_by"], name: "index_piece_wise_barcodes_on_modified_by", using: :btree
    t.index ["order_id"], name: "index_piece_wise_barcodes_on_order_id", unique: true, using: :btree
    t.index ["pickable"], name: "index_piece_wise_barcodes_on_pickable", using: :btree
    t.index ["pickable_at"], name: "index_piece_wise_barcodes_on_pickable_at", using: :btree
    t.index ["product_size_id"], name: "index_piece_wise_barcodes_on_product_size_id", using: :btree
    t.index ["status"], name: "index_piece_wise_barcodes_on_status", using: :btree
    t.index ["stock_up_date"], name: "index_piece_wise_barcodes_on_stock_up_date", using: :btree
  end

  create_table "pincode_courier_services", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "courier_id",              default: 0,              unsigned: true
    t.integer  "pincode",                 default: 0,              unsigned: true
    t.string   "area_code",    limit: 30
    t.string   "routing_code", limit: 30
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["courier_id"], name: "index_pincode_courier_services_on_courier_id", using: :btree
    t.index ["pincode"], name: "index_pincode_courier_services_on_pincode", using: :btree
  end

  create_table "pincode_services", primary_key: "pincode", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "prepaid"
    t.integer  "cod"
    t.integer  "reverse"
    t.string   "city",                 limit: 50
    t.string   "state",                limit: 50
    t.integer  "country_id",                      default: 0,              unsigned: true
    t.string   "country_name",         limit: 50
    t.integer  "status",               limit: 1
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "delivery_tat_daywise",                                     unsigned: true
    t.string   "zone",                 limit: 30
    t.integer  "slot_courier_id_250",             default: 0,              unsigned: true
    t.integer  "slot_courier_id_500",             default: 0,              unsigned: true
    t.integer  "prepaid_slot_250",                default: 0,              unsigned: true
    t.integer  "cod_slot_250",                    default: 0,              unsigned: true
    t.integer  "reverse_slot_250",                default: 0,              unsigned: true
    t.integer  "prepaid_slot_500",                default: 0,              unsigned: true
    t.integer  "cod_slot_500",                    default: 0,              unsigned: true
    t.integer  "reverse_slot_500",                default: 0,              unsigned: true
    t.integer  "prepaid_slot_750",                default: 0,              unsigned: true
    t.integer  "cod_slot_750",                    default: 0,              unsigned: true
    t.integer  "reverse_slot_750",                default: 0,              unsigned: true
    t.integer  "prepaid_slot_1000",               default: 0,              unsigned: true
    t.integer  "cod_slot_1000",                   default: 0,              unsigned: true
    t.integer  "reverse_slot_1000",               default: 0,              unsigned: true
    t.integer  "prepaid_slot_max",                default: 0,              unsigned: true
    t.integer  "cod_slot_max",                    default: 0,              unsigned: true
    t.integer  "reverse_slot_max",                default: 0,              unsigned: true
    t.string   "hra_classification"
    t.integer  "is_lockdown",                     default: 0,              unsigned: true
    t.index ["cod"], name: "index_pincode_services_on_cod", using: :btree
    t.index ["country_id"], name: "index_pincode_services_on_country_id", using: :btree
    t.index ["prepaid"], name: "index_pincode_services_on_prepaid", using: :btree
    t.index ["reverse"], name: "index_pincode_services_on_reverse", using: :btree
    t.index ["status"], name: "index_pincode_services_on_status", using: :btree
  end

  create_table "prepaid_remittances", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                                 default: 0,     null: false, unsigned: true
    t.string   "merchant_id",       limit: 100
    t.float    "expected_amount",   limit: 24
    t.decimal  "current_rate",                    precision: 12, scale: 2, default: "0.0"
    t.float    "remittance_amount", limit: 24
    t.float    "refund_amount",     limit: 24
    t.text     "utr",               limit: 65535
    t.decimal  "net_charges",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "tax",                             precision: 12, scale: 2, default: "0.0"
    t.decimal  "cgst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "igst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "sgst",                            precision: 12, scale: 2, default: "0.0"
    t.date     "settlement_date"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "request_action",                                                                        unsigned: true
    t.integer  "sap_status",                                                                            unsigned: true
    t.integer  "merchant",                                                                              unsigned: true
    t.index ["merchant"], name: "index_prepaid_remittances_on_merchant", using: :btree
    t.index ["order_id", "merchant_id"], name: "uniq_index", unique: true, using: :btree
    t.index ["settlement_date"], name: "index_prepaid_remittances_on_settlement_date", using: :btree
  end

  create_table "prepaid_remittances_1", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "id",                                                       default: 0,     null: false, unsigned: true
    t.bigint   "order_id",                                                 default: 0,     null: false, unsigned: true
    t.string   "merchant_id",       limit: 100
    t.float    "expected_amount",   limit: 24
    t.decimal  "current_rate",                    precision: 12, scale: 2, default: "0.0"
    t.float    "remittance_amount", limit: 24
    t.float    "refund_amount",     limit: 24
    t.text     "utr",               limit: 65535
    t.decimal  "net_charges",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "tax",                             precision: 12, scale: 2, default: "0.0"
    t.decimal  "cgst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "igst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "sgst",                            precision: 12, scale: 2, default: "0.0"
    t.date     "settlement_date"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "request_action",                                                                        unsigned: true
    t.integer  "sap_status",                                                                            unsigned: true
  end

  create_table "prepaid_remittances_bkp", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "id",                                                       default: 0,     null: false, unsigned: true
    t.bigint   "order_id",                                                 default: 0,     null: false, unsigned: true
    t.string   "merchant_id",       limit: 100
    t.float    "expected_amount",   limit: 24
    t.decimal  "current_rate",                    precision: 12, scale: 2, default: "0.0"
    t.float    "remittance_amount", limit: 24
    t.float    "refund_amount",     limit: 24
    t.text     "utr",               limit: 65535
    t.decimal  "net_charges",                     precision: 12, scale: 2, default: "0.0"
    t.decimal  "tax",                             precision: 12, scale: 2, default: "0.0"
    t.decimal  "cgst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "igst",                            precision: 12, scale: 2, default: "0.0"
    t.decimal  "sgst",                            precision: 12, scale: 2, default: "0.0"
    t.date     "settlement_date"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "request_action",                                                                        unsigned: true
    t.integer  "sap_status",                                                                            unsigned: true
  end

  create_table "privileges", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "admin_user_id"
    t.integer  "panel_state_id"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["admin_user_id"], name: "index_privileges_on_admin_user_id", using: :btree
    t.index ["panel_state_id"], name: "index_privileges_on_panel_state_id", using: :btree
  end

  create_table "product_categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id",  default: 0,              unsigned: true
    t.integer  "category_id", default: 0,              unsigned: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "priority",    default: 0,              unsigned: true
    t.index ["category_id"], name: "index_product_categories_on_category_id", using: :btree
    t.index ["product_id", "category_id"], name: "index_product_categories_on_product_id_and_category_id", unique: true, using: :btree
    t.index ["product_id"], name: "index_product_categories_on_product_id", using: :btree
  end

  create_table "product_size_avail_logs", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_size_id", default: 0,              unsigned: true
    t.integer  "qty_avail",       default: 0,              unsigned: true
    t.integer  "qty_avail_was",                            unsigned: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["product_size_id"], name: "index_product_size_avail_logs_on_product_size_id", using: :btree
  end

  create_table "product_sizes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id",                        default: 0, null: false, unsigned: true
    t.integer  "size_id",                           default: 0, null: false, unsigned: true
    t.integer  "qty_avail",                         default: 0,              unsigned: true
    t.integer  "qty_inventory",                     default: 0,              unsigned: true
    t.integer  "qty_deadinventory",                 default: 0,              unsigned: true
    t.integer  "qty_printingdefect",                default: 0,              unsigned: true
    t.integer  "qty_printing",                      default: 0,              unsigned: true
    t.integer  "qty_buffer",             limit: 1,  default: 0
    t.integer  "status",                 limit: 1,  default: 1
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "last_printing_at"
    t.integer  "qty_trigger",                       default: 0,              unsigned: true
    t.integer  "to_print",                          default: 0,              unsigned: true
    t.integer  "qty_pressing",                      default: 0,              unsigned: true
    t.integer  "stock_id",                                                   unsigned: true
    t.string   "article_code",           limit: 30
    t.integer  "sap_status",                        default: 0,              unsigned: true
    t.integer  "sap_quantity_fg01",                 default: 0,              unsigned: true
    t.integer  "sap_quantity_wb01",                 default: 0,              unsigned: true
    t.integer  "sap_quantity_pp01",                 default: 0,              unsigned: true
    t.integer  "sap_quantity_re01",                 default: 0,              unsigned: true
    t.integer  "sap_quantity_rj01",                 default: 0,              unsigned: true
    t.datetime "sap_updated_at"
    t.integer  "qty_untracked",                     default: 0,              unsigned: true
    t.integer  "qty_extra",                         default: 0,              unsigned: true
    t.integer  "box_code",                          default: 0,              unsigned: true
    t.integer  "weight",                            default: 0,              unsigned: true
    t.integer  "qty_in_printing",                   default: 0,              unsigned: true
    t.integer  "qty_pre_inventory",                 default: 0,              unsigned: true
    t.integer  "qty_prepack",                       default: 0,              unsigned: true
    t.integer  "qty_rto_received",                  default: 0,              unsigned: true
    t.integer  "qty_return_received",               default: 0,              unsigned: true
    t.integer  "qty_return_rto_checked",            default: 0,              unsigned: true
    t.integer  "qty_inv_liquidated",                default: 0,              unsigned: true
    t.integer  "sap_bom",                           default: 0,              unsigned: true
    t.integer  "sap_routing",                       default: 0,              unsigned: true
    t.integer  "sap_cost_run",                      default: 0,              unsigned: true
    t.index ["article_code"], name: "index_product_sizes_on_article_code", using: :btree
    t.index ["article_code"], name: "uniq_article_code", unique: true, using: :btree
    t.index ["product_id", "size_id"], name: "index_product_sizes_on_product_id_and_size_id", unique: true, using: :btree
    t.index ["product_id"], name: "index_product_sizes_on_product_id", using: :btree
    t.index ["size_id"], name: "index_product_sizes_on_size_id", using: :btree
  end

  create_table "product_status_logs", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "product_id",           default: 0,              unsigned: true
    t.integer  "status_was", limit: 1
    t.integer  "status_is",  limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["product_id"], name: "index_product_status_logs_on_product_id", using: :btree
  end

  create_table "products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",                limit: 65535
    t.string   "url",                        limit: 100
    t.string   "meta_title"
    t.text     "meta_description",           limit: 65535
    t.text     "meta_keywords",              limit: 65535
    t.float    "price",                      limit: 24
    t.float    "mrp",                        limit: 24
    t.float    "weight",                     limit: 24
    t.integer  "rank",                       limit: 2
    t.integer  "status",                     limit: 1,                              default: 0,                  comment: "0=>disabled,1=>enabled,2=>Discontinued, 3=>Comming soon"
    t.integer  "base_inventory",             limit: 1,                              default: 0,     null: false, comment: "0=>unlimited,1=>color,2=>inventory"
    t.integer  "color_id",                                                          default: 0,                                                                                                unsigned: true
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.integer  "model_id"
    t.datetime "launched_at"
    t.decimal  "stock_factor",                             precision: 12, scale: 3, default: "0.0"
    t.decimal  "sales_factor",                             precision: 12, scale: 3, default: "0.0"
    t.integer  "marketplace_status",         limit: 1,                              default: 0
    t.integer  "design_id"
    t.datetime "last_stockup_at"
    t.integer  "display_only_in_collection",                                        default: 0,                  comment: "Yes=>1, No=>0",                                                     unsigned: true
    t.boolean  "limited_edition",                                                   default: false
    t.date     "about_to_be_disabled"
    t.integer  "inventory_type",                                                    default: 0,                  comment: "0=>default,1=>show_limited_edition,2=>hide_limited_edition,3=>nos", unsigned: true
    t.string   "canonical_url"
    t.float    "flipkart_mrp",               limit: 24,                             default: 0.0
    t.integer  "ptype",                      limit: 1,                              default: 0,                  comment: "0=>single 1=>combo"
    t.integer  "offer_type",                 limit: 2,                              default: 0
    t.integer  "production_base_inventory",  limit: 1,                              default: 0,     null: false
    t.integer  "category_id",                                                       default: 0,                                                                                                unsigned: true
    t.integer  "back_from_disable",          limit: 1,                              default: 0
    t.string   "exclusive",                  limit: 100
    t.integer  "upcoming_to_enabled",        limit: 1,                              default: 0
    t.datetime "last_enabled_at"
    t.datetime "deal_end_date"
    t.float    "all_offer_price",            limit: 24
    t.float    "member_price",               limit: 24,                             default: 0.0
    t.float    "ctr",                        limit: 24
    t.index ["back_from_disable"], name: "index_products_on_back_from_disable", using: :btree
    t.index ["base_inventory"], name: "index_products_on_base_inventory", using: :btree
    t.index ["color_id"], name: "index_products_on_color_id", using: :btree
    t.index ["design_id"], name: "index_products_on_design_id", using: :btree
    t.index ["member_price"], name: "index_products_on_member_price", using: :btree
    t.index ["model_id"], name: "index_products_on_model_id", using: :btree
    t.index ["offer_type"], name: "index_products_on_offer_type", using: :btree
    t.index ["production_base_inventory"], name: "index_products_on_production_base_inventory", using: :btree
    t.index ["status", "base_inventory"], name: "index_products_on_status_and_base_inventory", using: :btree
    t.index ["status"], name: "index_products_on_status", using: :btree
    t.index ["upcoming_to_enabled"], name: "index_products_on_upcoming_to_enabled", using: :btree
    t.index ["url"], name: "index_products_on_url", unique: true, using: :btree
  end

  create_table "purchase_order_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "purchase_order_id",                                         default: 0,              unsigned: true
    t.string   "name"
    t.integer  "color_id",                                                  default: 0,              unsigned: true
    t.integer  "size_id",                                                   default: 0,              unsigned: true
    t.integer  "category_id",                                               default: 0,              unsigned: true
    t.integer  "product_id",                                                default: 0,              unsigned: true
    t.float    "price",                 limit: 24
    t.integer  "quantity",                                                  default: 0,              unsigned: true
    t.decimal  "tax",                              precision: 64, scale: 2
    t.integer  "rejected",                                                  default: 0,              unsigned: true
    t.integer  "is_other",              limit: 1,                           default: 0
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.integer  "in_quantity",                                               default: 0,              unsigned: true
    t.integer  "out_quantity",                                              default: 0,              unsigned: true
    t.integer  "child_category_id",                                                                  unsigned: true
    t.bigint   "category_stylecode_id",                                                              unsigned: true
    t.index ["category_id"], name: "index_purchase_order_products_on_category_id", using: :btree
    t.index ["color_id", "size_id"], name: "index_purchase_order_products_on_color_id_and_size_id", using: :btree
    t.index ["product_id"], name: "index_purchase_order_products_on_product_id", using: :btree
    t.index ["purchase_order_id"], name: "index_purchase_order_products_on_purchase_order_id", using: :btree
  end

  create_table "purchase_orders", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "vendor_id",                                                                                                      unsigned: true
    t.integer  "status",              limit: 1,                              default: 1
    t.string   "address_type",        limit: 2,                              default: "B"
    t.integer  "office_id",                                                  default: 0,                                         unsigned: true
    t.date     "duedate"
    t.text     "note",                limit: 65535
    t.integer  "admin_user_id",                                                                                                  unsigned: true
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "tag",                                                        default: 0,                                         unsigned: true
    t.decimal  "consumption_weight",                precision: 10, scale: 2
    t.decimal  "extra_fabric_weight",               precision: 10, scale: 2
    t.integer  "trims_issued",                                               default: 0,                comment: "0=>no 1=>yes", unsigned: true
    t.decimal  "used_fabric_weight",                precision: 10, scale: 2
    t.index ["admin_user_id"], name: "index_purchase_orders_on_admin_user_id", using: :btree
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id", using: :btree
  end

  create_table "pwb_investigate_issues", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "pwb_barcode",                    limit: 30,                null: false
    t.text     "error_message",                  limit: 65535
    t.integer  "status",                                       default: 0,              unsigned: true
    t.text     "comments",                       limit: 65535
    t.integer  "issue_creation_admin_user_id",                                          unsigned: true
    t.datetime "issue_resolution_date"
    t.integer  "issue_resolution_admin_user_id",                                        unsigned: true
    t.integer  "origin",                                                                unsigned: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["origin"], name: "index_pwb_investigate_issues_on_origin", using: :btree
    t.index ["pwb_barcode"], name: "index_pwb_investigate_issues_on_pwb_barcode", using: :btree
    t.index ["status"], name: "index_pwb_investigate_issues_on_status", using: :btree
  end

  create_table "ratings", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                 default: 0, null: false,                                                                  unsigned: true
    t.integer  "rating",     limit: 1,                              comment: "0=>very poor,1=>poor,2=>good,3=>very good,4=>awesome"
    t.integer  "was_easy",   limit: 1,                              comment: "0=>no,1=>yes"
    t.text     "details",    limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["order_id"], name: "index_ratings_on_order_id", using: :btree
    t.index ["rating"], name: "index_ratings_on_rating", using: :btree
    t.index ["was_easy"], name: "index_ratings_on_was_easy", using: :btree
  end

  create_table "received_shipments", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "barcode",         limit: 20
    t.string   "barcode_prefix",  limit: 5
    t.string   "challan",         limit: 15
    t.integer  "receivable_id"
    t.string   "receivable_type", limit: 20
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["barcode_prefix", "barcode"], name: "index_received_shipments_on_barcode_prefix_and_barcode", unique: true, using: :btree
  end

  create_table "referrals", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "status",                     default: 0
    t.bigint   "referrer_id",                                         unsigned: true
    t.bigint   "referee_id",                                          unsigned: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "referrer_mobile"
    t.string   "referee_mobile"
    t.float    "referrer_amount", limit: 24
    t.float    "referee_amount",  limit: 24
    t.index ["referee_id"], name: "index_referrals_on_referee_id", using: :btree
    t.index ["referrer_id", "referee_id"], name: "index_referrals_on_referrer_id_and_referee_id", unique: true, using: :btree
    t.index ["referrer_id"], name: "index_referrals_on_referrer_id", using: :btree
    t.index ["referrer_mobile", "referee_mobile"], name: "index_referrals_on_referrer_mobile_and_referee_mobile", unique: true, using: :btree
  end

  create_table "remittances", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "order_id",                                             default: 0,                       unsigned: true
    t.string   "barcode",          limit: 50
    t.string   "merchant"
    t.float    "remitted_amount",  limit: 24
    t.integer  "admin_user_id",                                        default: 0,                       unsigned: true
    t.datetime "remitted_date"
    t.string   "remit_type"
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.datetime "file_import_time"
    t.string   "status",                                               default: "Remitted"
    t.string   "unique_id"
    t.string   "utr"
    t.integer  "upload_type",                                                                            unsigned: true
    t.decimal  "fee",                         precision: 12, scale: 2, default: "0.0"
    t.decimal  "tax",                         precision: 12, scale: 2, default: "0.0"
    t.string   "merchant_id"
    t.integer  "file_upload_id",                                       default: 0,                       unsigned: true
    t.integer  "sap_status",                                           default: 0,                       unsigned: true
    t.string   "zone"
    t.decimal  "weight",                      precision: 12, scale: 2, default: "0.0"
    t.index ["barcode"], name: "index_remittances_on_barcode", using: :btree
    t.index ["order_id"], name: "index_remittances_on_order_id", using: :btree
    t.index ["remitted_date"], name: "index_remittances_on_remitted_date", using: :btree
    t.index ["unique_id"], name: "index_remittances_on_unique_id", using: :btree
  end

  create_table "remittances_paytm_incorrect", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "id",                          default: 0,          null: false, unsigned: true
    t.integer  "order_id",                    default: 0,                       unsigned: true
    t.string   "barcode",          limit: 50
    t.string   "merchant"
    t.float    "remitted_amount",  limit: 24
    t.integer  "admin_user_id",               default: 0,                       unsigned: true
    t.datetime "remitted_date"
    t.string   "remit_type"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "file_import_time"
    t.string   "status",                      default: "Remitted"
  end

  create_table "retail_billing_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "bill_id",                                                         default: 0,                  unsigned: true
    t.integer  "product_size_id",                                                 default: 0,                  unsigned: true
    t.float    "quantity",                 limit: 24,                             default: 0.0
    t.float    "price",                    limit: 24
    t.decimal  "discount",                               precision: 64, scale: 2
    t.decimal  "tax_amount",                             precision: 64, scale: 2
    t.datetime "created_at",                                                                      null: false
    t.datetime "updated_at",                                                                      null: false
    t.text     "other",                    limit: 65535
    t.integer  "tax_type",                 limit: 1,                              default: 0
    t.decimal  "igst_percentage",                        precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_amount",                            precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_percentage",                        precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_amount",                            precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_percentage",                        precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_amount",                            precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_percentage_shipping",               precision: 10, scale: 2, default: "0.0"
    t.decimal  "igst_amount_shipping",                   precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_percentage_shipping",               precision: 10, scale: 2, default: "0.0"
    t.decimal  "cgst_amount_shipping",                   precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_percentage_shipping",               precision: 10, scale: 2, default: "0.0"
    t.decimal  "sgst_amount_shipping",                   precision: 10, scale: 2, default: "0.0"
    t.integer  "unit",                                                            default: 0,                  unsigned: true
    t.string   "goods_services_code"
    t.integer  "goods_services_type",                                             default: 0
    t.index ["bill_id"], name: "index_retail_billing_products_on_bill_id", using: :btree
    t.index ["product_size_id"], name: "index_retail_billing_products_on_product_size_id", using: :btree
  end

  create_table "retail_billings", primary_key: "bill_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "vendor_id",                                                                   unsigned: true
    t.integer  "admin_user_id",                                                               unsigned: true
    t.datetime "bill_date"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "id_type"
    t.integer  "status",          limit: 1,                          default: 0
    t.integer  "invoice_id"
    t.decimal  "shipping_amount",           precision: 10, scale: 2
    t.integer  "reverse_charge",                                     default: 0,              unsigned: true
    t.index ["admin_user_id"], name: "index_retail_billings_on_admin_user_id", using: :btree
    t.index ["vendor_id"], name: "index_retail_billings_on_vendor_id", using: :btree
  end

  create_table "retail_expenses", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 300
    t.integer  "value",                  default: 0,                                            unsigned: true
    t.integer  "invoice_id",             default: 0,                                            unsigned: true
    t.string   "year",       limit: 10
    t.integer  "category",   limit: 1,   default: 0,              comment: "0=>Retail 1=>Bulk"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["invoice_id"], name: "index_retail_expenses_on_invoice_id", using: :btree
  end

  create_table "retail_invoice_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "retail_invoice_id",            default: 0, unsigned: true
    t.integer  "product_size_id",              default: 0, unsigned: true
    t.integer  "quantity",                     default: 0, unsigned: true
    t.integer  "price",                        default: 0, unsigned: true
    t.string   "year",              limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_size_id"], name: "index_retail_invoice_products_on_product_size_id", using: :btree
    t.index ["retail_invoice_id"], name: "index_retail_invoice_products_on_retail_invoice_id", using: :btree
  end

  create_table "retail_invoices", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "retail_invoice_id",                  default: 0,                  unsigned: true
    t.integer  "order_id",                           default: 0,                  unsigned: true
    t.integer  "invoice_id",                         default: 0,                  unsigned: true
    t.boolean  "is_generated",                       default: false
    t.boolean  "retailer_type",                      default: false
    t.string   "year",                   limit: 11
    t.integer  "billing_client_id",                  default: 0,                  unsigned: true
    t.integer  "tax_type",               limit: 1
    t.float    "tax_value",              limit: 24
    t.string   "product_order_no",       limit: 100
    t.datetime "product_order_date"
    t.date     "due_date"
    t.boolean  "discount_type",                      default: false
    t.integer  "discount_value",                     default: 0,                  unsigned: true
    t.integer  "advance",                            default: 0,                  unsigned: true
    t.integer  "admin_user_id",                      default: 0,                  unsigned: true
    t.date     "invoice_generated_date"
    t.date     "invoice_start_date"
    t.boolean  "is_send",                            default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["admin_user_id"], name: "index_retail_invoices_on_admin_user_id", using: :btree
    t.index ["invoice_id"], name: "index_retail_invoices_on_invoice_id", using: :btree
    t.index ["order_id"], name: "index_retail_invoices_on_order_id", using: :btree
  end

  create_table "return_receipt_image_map", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint  "order_id",     unsigned: true
    t.integer "imageable_id"
    t.index ["imageable_id"], name: "imageable_id", using: :btree
  end

  create_table "sales_dashboard_histories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "payload",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "dated"
  end

  create_table "sales_details", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.float    "promotional_wallet",        limit: 24,                             default: 0.0,   null: false
    t.decimal  "cancel",                                  precision: 10, scale: 1, default: "0.0"
    t.decimal  "rto",                                     precision: 10, scale: 1, default: "0.0"
    t.decimal  "return",                                  precision: 10, scale: 1, default: "0.0"
    t.float    "gross_sales",               limit: 24,                             default: 0.0,   null: false
    t.float    "net_sales",                 limit: 24,                             default: 0.0,   null: false
    t.decimal  "logistic_cost",                           precision: 10, scale: 1, default: "0.0"
    t.decimal  "net_cogs",                                precision: 10, scale: 1, default: "0.0"
    t.decimal  "gross_margin",                            precision: 10, scale: 1, default: "0.0"
    t.date     "added_date"
    t.integer  "hour",                      limit: 1,                              default: 0
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.decimal  "net_product_sales",                       precision: 10
    t.float    "product_gross_sales",       limit: 24
    t.text     "cancel_est",                limit: 65535
    t.text     "rto_est",                   limit: 65535
    t.text     "returned_est",              limit: 65535
    t.decimal  "gross_margin_contribution",               precision: 10, scale: 1, default: "0.0"
    t.index ["added_date", "hour"], name: "index_sales_details_on_added_date_and_hour", unique: true, using: :btree
  end

  create_table "sap_location_quantities", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "plant",                       default: 0,              unsigned: true
    t.string   "location",         limit: 5,              null: false
    t.string   "article_code",     limit: 30,             null: false
    t.integer  "quantity",                    default: 0,              unsigned: true
    t.integer  "blocked_quantity",            default: 0,              unsigned: true
    t.integer  "intr",                        default: 0,              unsigned: true
    t.integer  "last_updated_at",             default: 0, null: false, unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["plant", "location", "article_code"], name: "uniq_key", unique: true, using: :btree
  end

  create_table "sap_pwb_stockups", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "challan_number", limit: 40, default: "0"
    t.string   "pwb_barcode",    limit: 30
    t.integer  "status",         limit: 1,  default: 0,                comment: "0=>active,1=>inactive"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["pwb_barcode", "challan_number"], name: "uniq_challan_piece", unique: true, using: :btree
  end

  create_table "sap_references", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                  default: 0
    t.integer  "reference_type",            default: 0,              unsigned: true
    t.string   "reference_id",   limit: 10
    t.integer  "status",                    default: 0,              unsigned: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "code",                      default: 0,              unsigned: true
    t.bigint   "delivery_id",                                        unsigned: true
    t.bigint   "billing_id",                                         unsigned: true
    t.integer  "plant",                     default: 0,              unsigned: true
    t.integer  "pgi_status",                default: 0,              unsigned: true
    t.index ["order_id", "reference_type"], name: "index_sap_references_on_order_id_and_reference_type", unique: true, using: :btree
    t.index ["reference_id"], name: "index_sap_references_on_reference_id", unique: true, using: :btree
  end

  create_table "schedule_tasks", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "schedule_at"
    t.text     "comment",                 limit: 65535
    t.string   "task"
    t.string   "summary"
    t.string   "job_id"
    t.integer  "status",                                default: 0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.bigint   "schedule_by"
    t.string   "data_sheet_file_name"
    t.string   "data_sheet_content_type"
    t.integer  "data_sheet_file_size"
    t.datetime "data_sheet_updated_at"
    t.text     "data_object",             limit: 65535
  end

  create_table "service_charges", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "service_id",                    default: 0,   null: false,                                          unsigned: true
    t.float    "charges",            limit: 24,               null: false
    t.integer  "user_group",                    default: 0,                comment: "0=>normal_user 2=>tribe_user", unsigned: true
    t.integer  "status",                        default: 0,                comment: "0=>inactive 1=>active",        unsigned: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "additional_charges", limit: 24, default: 0.0, null: false
    t.index ["service_id", "user_group"], name: "index_service_charges_on_service_id_and_user_group", unique: true, using: :btree
  end

  create_table "services", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",          limit: 100
    t.text     "description",   limit: 65535
    t.integer  "service_type",                default: 0,              comment: "0=>standard_shipping 1=>standard_cod 2=>priority_dispatch 3=>prioriy_shipping 4=>next_day_delivery", unsigned: true
    t.integer  "status",                      default: 0,              comment: "0=>inactive 1=>active",                                                                              unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "service_group",               default: 0,              comment: "0=>dispatch_delivery, 1=>miscellaneous",                                                             unsigned: true
    t.integer  "service_level",               default: 0,              comment: "0=>default, 1=>standard, 1=>priority",                                                               unsigned: true
    t.index ["service_type"], name: "index_services_on_service_type", unique: true, using: :btree
  end

  create_table "shipment_packing_products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "shipment_packing_id",       default: 0,              unsigned: true
    t.integer  "purchase_order_product_id", default: 0,              unsigned: true
    t.integer  "quantity",                  default: 0,              unsigned: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["shipment_packing_id"], name: "index_shipment_packing_products_on_shipment_packing_id", using: :btree
  end

  create_table "shipment_packings", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "location",                 default: 0,                unsigned: true
    t.float    "weight",        limit: 24, default: 0.0
    t.integer  "admin_user_id",            default: 0,                unsigned: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "shipment_code",            default: 0,                unsigned: true
    t.string   "remark"
    t.integer  "status",                   default: 1,                unsigned: true
    t.index ["location"], name: "index_shipment_packings_on_location", using: :btree
  end

  create_table "stock_category_color_size_mapping", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "stock_id", default: 0, null: false, unsigned: true
    t.integer "ps_id",    default: 0,              unsigned: true
  end

  create_table "stocks", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "size_id",                        default: 0,              unsigned: true
    t.integer  "color_id",                       default: 0,              unsigned: true
    t.integer  "category_id",                    default: 0,              unsigned: true
    t.integer  "quantity",                       default: 0,              unsigned: true
    t.integer  "buffer",                         default: 4,              unsigned: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "weight",                         default: 0,              unsigned: true
    t.integer  "box_code",                       default: 0,              unsigned: true
    t.string   "stock_location_code", limit: 50
    t.integer  "status",                         default: 1,              unsigned: true
    t.string   "article_code",        limit: 30
    t.integer  "sap_status",                     default: 0,              unsigned: true
    t.integer  "sap_quantity_sf01",              default: 0,              unsigned: true
    t.datetime "sap_updated_at"
    t.integer  "quantity_freeze",                default: 0,              unsigned: true
    t.integer  "sap_quantity",                   default: 0,              unsigned: true
    t.integer  "sap_freeze_quantity",            default: 0,              unsigned: true
    t.index ["size_id", "color_id", "category_id"], name: "index_stocks_on_size_id_and_color_id_and_category_id", unique: true, using: :btree
  end

  create_table "stocks_dec_17", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "size_id",     default: 0,              unsigned: true
    t.integer  "color_id",    default: 0,              unsigned: true
    t.integer  "category_id", default: 0,              unsigned: true
    t.integer  "quantity"
    t.integer  "buffer",      default: 0,              unsigned: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["size_id", "color_id", "category_id"], name: "index_stocks_on_size_id_and_color_id_and_category_id", unique: true, using: :btree
  end

  create_table "stocks_dec_17_bkp", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "size_id",     default: 0,              unsigned: true
    t.integer  "color_id",    default: 0,              unsigned: true
    t.integer  "category_id", default: 0,              unsigned: true
    t.integer  "quantity"
    t.integer  "buffer",      default: 0,              unsigned: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["size_id", "color_id", "category_id"], name: "index_stocks_on_size_id_and_color_id_and_category_id", unique: true, using: :btree
  end

  create_table "stylecode_trims", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "category_id",                                    unsigned: true
    t.bigint   "color_id",                                       unsigned: true
    t.integer  "size_id",               default: 0, null: false, unsigned: true
    t.bigint   "trim_id",                                        unsigned: true
    t.bigint   "category_stylecode_id",                          unsigned: true
    t.integer  "quantity",              default: 0,              unsigned: true
    t.integer  "fabric_type",           default: 0,              unsigned: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["category_id"], name: "index_stylecode_trims_on_category_id", using: :btree
    t.index ["trim_id"], name: "index_stylecode_trims_on_trim_id", using: :btree
  end

  create_table "tags", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "tag_type",   limit: 2, default: 0
  end

  create_table "temp", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "user_id", default: 0, null: false, unsigned: true
    t.bigint "c",       default: 0, null: false
  end

  create_table "temp_op", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "barcode", limit: 50
    t.bigint "c",                     default: 0, null: false
    t.text   "o",       limit: 65535,                          collation: "utf8_general_ci"
  end

  create_table "temp_product_size_article_code", primary_key: "product_size_id", id: :integer, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "article_code", limit: 30
  end

  create_table "temp_ps", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "category_id",               default: 0,                                            unsigned: true
    t.integer "design_id"
    t.integer "color_id",                  default: 0,                                            unsigned: true
    t.text    "ids",         limit: 65535,                          collation: "utf8_general_ci"
    t.text    "ds",          limit: 65535,                          collation: "utf8_general_ci"
    t.bigint  "c",                         default: 0, null: false
  end

  create_table "temp_stock_article_code", primary_key: "stock_id", id: :integer, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "article_code", limit: 30
  end

  create_table "timelines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "category",    limit: 1,                              comment: "3=>New Arrivals,4=>Important Updates,8=>As Seen on Media"
    t.text     "redirect_to", limit: 65535
    t.string   "url",         limit: 100
    t.text     "post_name",   limit: 65535
    t.text     "post_title",  limit: 65535
    t.integer  "status",      limit: 1,     default: 0,              comment: "0=>inactive,1=>active"
    t.text     "description", limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["status"], name: "index_timelines_on_status", using: :btree
    t.index ["url"], name: "index_timelines_on_url", using: :btree
  end

  create_table "tracking_provider_statuses", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "status_code",                          default: 0,              unsigned: true
    t.integer  "internal_status",                      default: 0,              unsigned: true
    t.integer  "return_internal_status",               default: 0,              unsigned: true
    t.integer  "type_id",                              default: 0,              unsigned: true
    t.string   "status"
    t.text     "description",            limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["internal_status"], name: "index_tracking_provider_statuses_on_internal_status", using: :btree
    t.index ["status_code"], name: "index_tracking_provider_statuses_on_status_code", using: :btree
  end

  create_table "transactions", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                             default: 0, null: false, unsigned: true
    t.bigint   "user_id",                              default: 0, null: false, unsigned: true
    t.integer  "amount"
    t.string   "transaction_id",         limit: 100
    t.string   "payment_method"
    t.integer  "merchant"
    t.string   "merchant_error"
    t.integer  "merchant_status"
    t.text     "transaction_json",       limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "primary_payment_method"
    t.index ["order_id"], name: "index_transactions_on_order_id", using: :btree
    t.index ["transaction_id"], name: "index_transactions_on_transaction_id", using: :btree
  end

  create_table "trims", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "code"
    t.string   "brand_name"
    t.string   "model_number"
    t.string   "name"
    t.text     "description",         limit: 65535
    t.string   "color_name"
    t.string   "size"
    t.string   "unit_of_measurement"
    t.float    "price",               limit: 24
    t.integer  "quantity",                          default: 0,              unsigned: true
    t.integer  "bundle_quantity",                   default: 0,              unsigned: true
    t.integer  "min_quantity",                      default: 0,              unsigned: true
    t.integer  "status",              limit: 1,     default: 1
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["brand_name"], name: "index_trims_on_brand_name", using: :btree
    t.index ["code"], name: "index_trims_on_code", using: :btree
    t.index ["model_number"], name: "index_trims_on_model_number", using: :btree
    t.index ["name"], name: "index_trims_on_name", using: :btree
    t.index ["unit_of_measurement"], name: "index_trims_on_unit_of_measurement", using: :btree
  end

  create_table "uniq_mobile", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "id",                default: 0, null: false, unsigned: true
    t.string "mobile", limit: 15
    t.index ["id"], name: "id", using: :btree
  end

  create_table "url_products_sorts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "products_list", limit: 65535
    t.integer  "sort_type",                   default: 0
    t.integer  "url_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["sort_type"], name: "index_url_products_sorts_on_sort_type", using: :btree
    t.index ["url_id"], name: "index_url_products_sorts_on_url_id", using: :btree
  end

  create_table "url_weightages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "url_id"
    t.string   "key"
    t.float    "value",      limit: 24, default: 0.0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "urls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "url",                  limit: 75,                    null: false
    t.string   "meta_title"
    t.text     "meta_description",     limit: 65535
    t.text     "meta_keywords",        limit: 65535
    t.string   "canonical_url"
    t.string   "new_url",              limit: 75,                    null: false
    t.integer  "status",               limit: 1,     default: 0
    t.integer  "url_type",             limit: 1,     default: 0
    t.text     "filters_applied",      limit: 65535
    t.text     "product_ids",          limit: 65535
    t.text     "tags",                 limit: 65535
    t.text     "designs",              limit: 65535
    t.text     "designers",            limit: 65535
    t.text     "misc",                 limit: 65535
    t.string   "title"
    t.text     "description",          limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "breadcrumb_text"
    t.integer  "breadcrumb_level"
    t.boolean  "filter_visible",                     default: false
    t.string   "rc"
    t.boolean  "is_visible_on_search",               default: true
    t.integer  "auto_disable_status",                default: 1
    t.bigint   "level1_url_id",                                                   unsigned: true
    t.integer  "cdn_cache",            limit: 2,     default: 0
    t.string   "seo_head"
    t.integer  "level0_url_id",                                                   unsigned: true
    t.string   "segments_list"
    t.string   "deal_text"
    t.datetime "deal_start_date"
    t.datetime "deal_end_date"
    t.text     "offer_types",          limit: 65535
    t.index ["auto_disable_status"], name: "index_urls_on_auto_disable_status", using: :btree
    t.index ["cdn_cache"], name: "index_urls_on_cdn_cache", using: :btree
    t.index ["is_visible_on_search"], name: "index_urls_on_is_visible_on_search", using: :btree
    t.index ["level0_url_id"], name: "index_urls_on_level0_url_id", using: :btree
    t.index ["new_url"], name: "index_urls_on_new_url", unique: true, using: :btree
    t.index ["status"], name: "index_urls_on_status", using: :btree
    t.index ["url"], name: "index_urls_on_url", unique: true, using: :btree
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint  "user_id",                                 unsigned: true
    t.boolean "customer_awareness_mail", default: false
    t.index ["user_id"], name: "index_user_details_on_user_id", using: :btree
  end

  create_table "user_facts", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                     default: 0, null: false, unsigned: true
    t.float    "score",            limit: 24
    t.float    "level",            limit: 24
    t.datetime "score_updated_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["user_id"], name: "index_user_facts_on_user_id", unique: true, using: :btree
  end

  create_table "user_feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "question_id",                                                 unsigned: true
    t.integer  "order_id",                                                    unsigned: true
    t.integer  "user_id",                                                     unsigned: true
    t.text     "rating",               limit: 65535
    t.text     "feedback",             limit: 65535
    t.integer  "mail_delivery_status",               default: 0,              unsigned: true
    t.datetime "delivery_date"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["mail_delivery_status"], name: "index_user_feedbacks_on_mail_delivery_status", using: :btree
    t.index ["order_id", "question_id"], name: "index_user_feedbacks_on_order_id_and_question_id", unique: true, using: :btree
    t.index ["question_id"], name: "index_user_feedbacks_on_question_id", using: :btree
    t.index ["user_id"], name: "index_user_feedbacks_on_user_id", using: :btree
  end

  create_table "user_refunds", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                                   default: 0,     null: false,                                                                                      unsigned: true
    t.float    "total_amount",           limit: 24
    t.decimal  "promotional_wallet",                precision: 12, scale: 3, default: "0.0"
    t.decimal  "non_promotional_wallet",            precision: 12, scale: 3, default: "0.0"
    t.integer  "merchant_refund_amount"
    t.integer  "self_ship",                                                  default: 0
    t.decimal  "extra_credits",                     precision: 12, scale: 3, default: "0.0"
    t.integer  "order_from_status",                                                                                                                                                            unsigned: true
    t.integer  "order_to_status",                                                                                                                                                              unsigned: true
    t.integer  "refund_option",                                              default: 0,                  comment: "0=>cancel 1=>return 2=>unlocate 3=>rto 4=>compensate 5=>original_account", unsigned: true
    t.integer  "admin_user_id",                                              default: 0,                                                                                                       unsigned: true
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.integer  "sap_status",                                                                              comment: "0=>initial,1=>sap_order_created,2=>sap_collection_created,3=>processed",   unsigned: true
    t.integer  "sap_refund_mode",                                                                         comment: "0=>R1,1=>R2,2=>R3,3=>R4,4=>R5,5=>R6,6=>R7",                                unsigned: true
    t.index ["order_from_status"], name: "index_user_refunds_on_order_from_status", using: :btree
    t.index ["order_id", "refund_option"], name: "index_user_refunds_on_order_id_and_refund_option", unique: true, using: :btree
    t.index ["order_to_status"], name: "index_user_refunds_on_order_to_status", using: :btree
    t.index ["refund_option"], name: "index_user_refunds_on_refund_option", using: :btree
  end

  create_table "user_reviews", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",           limit: 100
    t.string   "email",          limit: 100,   default: "", null: false
    t.text     "review_content", limit: 65535
    t.integer  "status",         limit: 1,     default: 0,               comment: "0=>disabled,1=>enabled"
    t.string   "source",         limit: 100
    t.string   "url",            limit: 100
    t.integer  "priority"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["email"], name: "index_user_reviews_on_email", unique: true, using: :btree
    t.index ["status"], name: "index_user_reviews_on_status", using: :btree
  end

  create_table "user_settings", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id",                 unsigned: true
    t.boolean  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "opt_in"
    t.index ["id"], name: "index_user_settings_on_id", using: :btree
    t.index ["user_id", "opt_in"], name: "index_user_settings_on_user_id_and_opt_in", using: :btree
    t.index ["user_id"], name: "index_user_settings_on_user_id", using: :btree
  end

  create_table "user_sources", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                 default: 0, null: false, unsigned: true
    t.string   "utm_source",   limit: 50
    t.string   "utm_medium",   limit: 50
    t.string   "utm_campaign", limit: 50
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_user_sources_on_user_id", using: :btree
  end

  create_table "user_tags", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "user_id",                 unsigned: true
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_user_tags_on_id", using: :btree
    t.index ["key"], name: "index_user_tags_on_key", using: :btree
    t.index ["source"], name: "index_user_tags_on_source", using: :btree
    t.index ["user_id"], name: "index_user_tags_on_user_id", using: :btree
    t.index ["value"], name: "index_user_tags_on_value", using: :btree
  end

  create_table "user_with_not_promo", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "user_id", default: 0, null: false, unsigned: true
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "user_with_promo", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "user_id", default: 0, null: false, unsigned: true
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "users", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name",                    limit: 100
    t.string   "last_name",                     limit: 100
    t.integer  "gender",                        limit: 1
    t.integer  "status",                        limit: 1
    t.integer  "device_type",                   limit: 1,                            default: 0
    t.date     "date_of_birth"
    t.decimal  "old_wallet",                                precision: 12, scale: 3, default: "0.0"
    t.string   "facebook_id"
    t.string   "google_id"
    t.string   "email",                         limit: 100,                          default: "",    null: false
    t.string   "encrypted_password",            limit: 70,                           default: "",    null: false
    t.integer  "sign_in_count",                 limit: 1,                            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",            limit: 20
    t.string   "last_sign_in_ip",               limit: 20
    t.string   "mobile",                        limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "is_verified",                   limit: 1,                            default: 0
    t.integer  "email_status",                                                       default: 0,                  unsigned: true
    t.integer  "mobile_status",                                                      default: 0,                  unsigned: true
    t.decimal  "non_promotional_wallet_amount",             precision: 12, scale: 3, default: "0.0"
    t.decimal  "promotional_wallet_amount",                 precision: 12, scale: 3, default: "0.0"
    t.integer  "blacklist_user",                                                     default: 0,                  unsigned: true
    t.string   "clean_mobile",                  limit: 15
    t.integer  "sap_status",                                                         default: 0,                  unsigned: true
    t.string   "referral_code"
    t.string   "juspay_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["facebook_id"], name: "index_users_on_facebook_id", using: :btree
    t.index ["first_name"], name: "index_users_on_first_name", type: :fulltext
    t.index ["google_id"], name: "index_users_on_google_id", using: :btree
    t.index ["juspay_id"], name: "index_users_on_juspay_id", unique: true, length: { juspay_id: 30 }, using: :btree
    t.index ["last_name"], name: "index_users_on_last_name", type: :fulltext
    t.index ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
    t.index ["referral_code"], name: "index_users_on_referral_code", unique: true, length: { referral_code: 10 }, using: :btree
    t.index ["status"], name: "index_users_on_status", using: :btree
  end

  create_table "users_votes", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                      unsigned: true
    t.bigint   "vote_content_id",                              unsigned: true
    t.integer  "vote"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "sent_email_sms",  default: false
    t.index ["sent_email_sms"], name: "index_users_votes_on_sent_email_sms", using: :btree
    t.index ["user_id"], name: "index_users_votes_on_user_id", using: :btree
    t.index ["vote"], name: "index_users_votes_on_vote", using: :btree
    t.index ["vote_content_id"], name: "index_users_votes_on_vote_content_id", using: :btree
  end

  create_table "vendor_payment_dues", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "vendor_payment_id",            default: 0,              unsigned: true
    t.date     "due_date"
    t.float    "due_amount",        limit: 24
    t.integer  "status",            limit: 1
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["vendor_payment_id"], name: "index_vendor_payment_dues_on_vendor_payment_id", using: :btree
  end

  create_table "vendor_payments", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "bill_no",       limit: 20
    t.datetime "bill_date"
    t.integer  "vendor_id",                   default: 0,              unsigned: true
    t.text     "description",   limit: 65535
    t.float    "advance",       limit: 24
    t.float    "deduction",     limit: 24
    t.text     "remarks",       limit: 65535
    t.text     "scancopy_path", limit: 65535
    t.integer  "admin_user_id",               default: 0,              unsigned: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["admin_user_id"], name: "index_vendor_payments_on_admin_user_id", using: :btree
    t.index ["bill_no"], name: "index_vendor_payments_on_bill_no", using: :btree
  end

  create_table "vendors", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city",              limit: 50
    t.string   "state",             limit: 50
    t.integer  "pincode",                      default: 0,   unsigned: true
    t.string   "contact_no",        limit: 15
    t.string   "tin",               limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_number"
    t.string   "ifsc_code"
    t.string   "email"
    t.integer  "vendor_type",       limit: 1,  default: 0
    t.string   "cst_tin",           limit: 15
    t.string   "initial",           limit: 2
    t.string   "gstin"
    t.integer  "payment_term",                 default: 0,   unsigned: true
    t.integer  "status",                       default: 0
    t.integer  "registration_type",            default: 0
    t.integer  "parent_id",                    default: 0,   unsigned: true
    t.string   "pan_number",        limit: 10
    t.string   "branch_name"
    t.integer  "added_by",                     default: 0,   unsigned: true
    t.integer  "approved_by",                  default: 0,   unsigned: true
    t.string   "concerned_person"
    t.string   "alternate_contact",            default: "0"
    t.string   "hsn_code"
    t.string   "beneficiary_name"
    t.index ["pincode"], name: "index_vendors_on_pincode", using: :btree
  end

  create_table "verify_numbers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "contact_no",       limit: 15,                 null: false
    t.string   "contact_type",     limit: 10
    t.bigint   "order_id",                    default: 0,     null: false, unsigned: true
    t.datetime "verified_date"
    t.datetime "transaction_time"
    t.string   "operator",         limit: 20
    t.string   "telecomcircle"
    t.string   "dnd_status",       limit: 5
    t.boolean  "is_confirmed",                default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["order_id"], name: "index_verify_numbers_on_order_id", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "item_type",  limit: 191,        null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "videos", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "videoable_id"
    t.string   "videoable_type"
    t.string   "url"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["videoable_type", "videoable_id"], name: "index_videos_on_videoable_type_and_videoable_id", using: :btree
  end

  create_table "view_product_logs", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "user_id",     limit: 50
    t.integer  "product_id",             default: 0,              unsigned: true
    t.integer  "order_id",               default: 0,              unsigned: true
    t.integer  "device_type",            default: 0,              unsigned: true
    t.string   "view_source"
    t.string   "cart_source"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "vote_contents", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.integer  "likes",                     default: 0
    t.integer  "dislikes",                  default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "status",                    default: 0
    t.bigint   "design_id",                                          unsigned: true
    t.integer  "gender",      limit: 1
    t.datetime "expiry_date",                           null: false
    t.integer  "vote_type",   limit: 1,     default: 0
    t.string   "category"
    t.index ["design_id"], name: "index_vote_contents_on_design_id", using: :btree
    t.index ["gender"], name: "index_vote_contents_on_gender", using: :btree
  end

  create_table "vpas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "upi_id"
    t.integer  "user_id"
    t.integer  "BIGINT UNSIGNED NOT NULL DEFAULT 0_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["BIGINT UNSIGNED NOT NULL DEFAULT 0_id"], name: "index_vpas_on_BIGINT UNSIGNED NOT NULL DEFAULT 0_id", using: :btree
    t.index ["upi_id"], name: "index_vpas_on_upi_id", using: :btree
    t.index ["user_id"], name: "index_vpas_on_user_id", using: :btree
  end

  create_table "wallet_expiry_maps", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                          default: 0,     null: false, unsigned: true
    t.decimal  "amount",                  precision: 12, scale: 3, default: "0.0"
    t.date     "expiry_date"
    t.string   "type",        limit: 100
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.index ["expiry_date"], name: "index_wallet_expiry_maps_on_expiry_date", using: :btree
    t.index ["type", "expiry_date", "user_id"], name: "index_wallet_expiry_maps_on_type_and_expiry_date_and_user_id", unique: true, using: :btree
    t.index ["type"], name: "index_wallet_expiry_maps_on_type", using: :btree
    t.index ["user_id"], name: "index_wallet_expiry_maps_on_user_id", using: :btree
  end

  create_table "wallets", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "order_id",                                                                        unsigned: true
    t.bigint   "user_id",                                            default: 0,     null: false, unsigned: true
    t.integer  "admin_user_id",                                      default: 0,                  unsigned: true
    t.string   "details"
    t.integer  "category",                                           default: 0
    t.decimal  "credit_amount",             precision: 12, scale: 3, default: "0.0"
    t.decimal  "debit_amount",              precision: 12, scale: 3, default: "0.0"
    t.integer  "status",        limit: 1,                            default: 0
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "type",          limit: 100
    t.date     "expiry_date"
    t.index ["category"], name: "index_wallets_on_category", using: :btree
    t.index ["order_id"], name: "index_wallets_on_order_id", using: :btree
    t.index ["status"], name: "index_wallets_on_status", using: :btree
    t.index ["user_id"], name: "index_wallets_on_user_id", using: :btree
  end

  create_table "wip_logs", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "matnr"
    t.integer  "planned_qty", default: 0,              unsigned: true
    t.integer  "issued_qty",  default: 0,              unsigned: true
    t.integer  "confirm_qty", default: 0,              unsigned: true
    t.integer  "status",      default: 0,              unsigned: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "sfrej_qty",   default: 0,              unsigned: true
    t.index ["status"], name: "index_wip_logs_on_status", using: :btree
  end

  create_table "wishlists", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint   "user_id",                                        unsigned: true
    t.integer  "product_id",            default: 0, null: false, unsigned: true
    t.integer  "device_type", limit: 1, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "product_id"], name: "index_wishlists_on_user_id_and_product_id", unique: true, using: :btree
  end

end
