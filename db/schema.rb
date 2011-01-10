# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100809091847) do

  create_table "admin_users", :force => true do |t|
    t.string   "name"
    t.string   "belongs_to"
    t.string   "login_id"
    t.string   "password"
    t.integer  "authority_id"
    t.integer  "activity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "retailer_id",  :default => 1
  end

  add_index "admin_users", ["deleted_at"], :name => "index_admin_users_on_deleted_at"
  add_index "admin_users", ["login_id"], :name => "index_admin_users_on_login_id"
  add_index "admin_users", ["position"], :name => "index_admin_users_on_position"

  create_table "authorities", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "authorities_functions", :id => false, :force => true do |t|
    t.integer  "authority_id"
    t.integer  "function_id"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "dir_name"
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.integer  "max_application_number"
    t.integer  "application_count"
    t.boolean  "repeat_application"
    t.boolean  "put_wagon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "open_pc_free_space_1"
    t.text     "open_pc_free_space_2"
    t.text     "open_pc_free_space_3"
    t.text     "open_pc_free_space_4"
    t.text     "end_pc_free_space_1"
    t.text     "end_pc_free_space_2"
    t.text     "end_pc_free_space_3"
    t.text     "end_pc_free_space_4"
    t.text     "open_mobile_free_space_1"
    t.text     "open_mobile_free_space_2"
    t.text     "open_mobile_free_space_3"
    t.text     "end_mobile_free_space_1"
    t.text     "end_mobile_free_space_2"
    t.text     "end_mobile_free_space_3"
    t.integer  "product_id"
    t.datetime "deleted_at"
    t.string   "product_code"
  end

  add_index "campaigns", ["deleted_at"], :name => "index_campaigns_on_deleted_at"
  add_index "campaigns", ["product_id"], :name => "index_campaigns_on_product_id"

  create_table "campaigns_customers", :id => false, :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns_customers", ["campaign_id"], :name => "index_campaigns_customers_on_campaign_id"
  add_index "campaigns_customers", ["customer_id"], :name => "index_campaigns_customers_on_customer_id"

  create_table "carts", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "quantity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_style_id"
    t.datetime "deleted_at"
    t.integer  "campaign_id"
    t.string   "aff_id"
  end

  add_index "carts", ["customer_id"], :name => "index_carts_on_customer_id"
  add_index "carts", ["deleted_at"], :name => "index_carts_on_deleted_at"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "code"
    t.string   "parent_code"
    t.string   "children_ids"
    t.integer  "resource_id"
    t.integer  "menu_resource_id"
    t.text     "free_space"
  end

  add_index "categories", ["deleted_at"], :name => "index_categories_on_deleted_at"
  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "constants", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "const_key"
    t.datetime "deleted_at"
  end

  add_index "constants", ["deleted_at"], :name => "index_constants_on_deleted_at"

  create_table "customers", :force => true do |t|
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.integer  "sex"
    t.integer  "age"
    t.integer  "point"
    t.integer  "occupation_id"
    t.integer  "prefecture_id"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_name_kana"
    t.string   "first_name_kana"
    t.string   "email"
    t.string   "mobile_serial"
    t.string   "activation_key"
    t.string   "password"
    t.string   "address_city"
    t.string   "address_detail"
    t.string   "login_id"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activate"
    t.integer  "receive_mailmagazine"
    t.integer  "mobile_carrier"
    t.boolean  "black"
    t.datetime "deleted_at"
    t.string   "mobile_type"
    t.string   "user_agent"
    t.string   "corporate_name"
    t.string   "corporate_name_kana"
    t.string   "section_name"
    t.string   "section_name_kana"
    t.string   "contact_tel01"
    t.string   "contact_tel02"
    t.string   "contact_tel03"
    t.string   "temp_password"
    t.string   "address_building"
    t.string   "cookie"
    t.boolean  "reachable"
    t.integer  "mail_delivery_count"
  end

  add_index "customers", ["deleted_at"], :name => "index_customers_on_deleted_at"
  add_index "customers", ["email"], :name => "index_customers_on_email"
  add_index "customers", ["login_id"], :name => "index_customers_on_login_id"
  add_index "customers", ["occupation_id"], :name => "index_customers_on_occupation_id"
  add_index "customers", ["password"], :name => "index_customers_on_password"
  add_index "customers", ["prefecture_id"], :name => "index_customers_on_prefecture_id"

  create_table "delivery_addresses", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "prefecture_id"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.integer  "position"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_name_kana"
    t.string   "first_name_kana"
    t.string   "address_city"
    t.string   "address_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "delivery_addresses", ["customer_id"], :name => "index_delivery_addresses_on_customer_id"
  add_index "delivery_addresses", ["deleted_at"], :name => "index_delivery_addresses_on_deleted_at"
  add_index "delivery_addresses", ["position"], :name => "index_delivery_addresses_on_position"
  add_index "delivery_addresses", ["prefecture_id"], :name => "index_delivery_addresses_on_prefecture_id"

  create_table "delivery_dates", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "delivery_dates", ["deleted_at"], :name => "index_delivery_dates_on_deleted_at"
  add_index "delivery_dates", ["product_id"], :name => "index_delivery_dates_on_product_id"

  create_table "delivery_fees", :force => true do |t|
    t.integer  "price"
    t.integer  "delivery_trader_id"
    t.integer  "prefecture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "delivery_fees", ["deleted_at"], :name => "index_delivery_fees_on_deleted_at"
  add_index "delivery_fees", ["delivery_trader_id"], :name => "index_delivery_fees_on_delivery_trader_id"
  add_index "delivery_fees", ["prefecture_id"], :name => "index_delivery_fees_on_prefecture_id"

  create_table "delivery_tickets", :force => true do |t|
    t.integer  "order_delivery_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "delivery_times", :force => true do |t|
    t.integer  "position"
    t.integer  "delivery_trader_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "code"
  end

  add_index "delivery_times", ["deleted_at"], :name => "index_delivery_times_on_deleted_at"
  add_index "delivery_times", ["delivery_trader_id"], :name => "index_delivery_times_on_delivery_trader_id"
  add_index "delivery_times", ["position"], :name => "index_delivery_times_on_position"

  create_table "delivery_traders", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "retailer_id", :default => 1
  end

  add_index "delivery_traders", ["deleted_at"], :name => "index_delivery_traders_on_deleted_at"
  add_index "delivery_traders", ["position"], :name => "index_delivery_traders_on_position"

  create_table "designs", :force => true do |t|
    t.text     "pc1"
    t.text     "pc2"
    t.text     "mobile1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.text     "mobile_header"
    t.text     "mobile_footer"
  end

  add_index "designs", ["deleted_at"], :name => "index_designs_on_deleted_at"

  create_table "faqs", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "site_type"
    t.string   "category"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "faqs", ["deleted_at"], :name => "index_faqs_on_deleted_at"
  add_index "faqs", ["position"], :name => "index_faqs_on_position"

  create_table "feature_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "feature_id"
    t.integer  "position"
    t.integer  "image_resource_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.string   "dir_name"
    t.integer  "feature_type"
    t.integer  "image_resource_id"
    t.boolean  "permit"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "functions", ["deleted_at"], :name => "index_functions_on_deleted_at"
  add_index "functions", ["position"], :name => "index_functions_on_position"

  create_table "image_resources", :force => true do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.datetime "deleted_at"
  end

  add_index "image_resources", ["deleted_at"], :name => "index_image_resources_on_deleted_at"

  create_table "inquiries", :force => true do |t|
    t.text     "body"
    t.string   "email"
    t.string   "name"
    t.string   "tel"
    t.string   "order_number"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "inquiries", ["deleted_at"], :name => "index_inquiries_on_deleted_at"

  create_table "kiyakus", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "kiyakus", ["deleted_at"], :name => "index_kiyakus_on_deleted_at"
  add_index "kiyakus", ["position"], :name => "index_kiyakus_on_position"

  create_table "laws", :force => true do |t|
    t.string   "company"
    t.string   "manager"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.integer  "prefecture_id"
    t.string   "address_city"
    t.string   "address_detail"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.string   "email"
    t.string   "url"
    t.text     "necessary_charge"
    t.text     "order_method"
    t.text     "payment_method"
    t.text     "payment_time_limit"
    t.text     "delivery_time"
    t.text     "return_exchange"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "render_type",               :default => 0
    t.integer  "retailer_id"
    t.text     "necessary_charge_mobile"
    t.text     "order_method_mobile"
    t.text     "payment_method_mobile"
    t.text     "payment_time_limit_mobile"
    t.text     "delivery_time_mobile"
    t.text     "return_exchange_mobile"
  end

  add_index "laws", ["deleted_at"], :name => "index_laws_on_deleted_at"

  create_table "mail_magazine_templates", :force => true do |t|
    t.integer  "form"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mail_magazine_templates", ["deleted_at"], :name => "index_mail_magazine_templates_on_deleted_at"

  create_table "mail_magazines", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.text     "condition"
    t.integer  "schedule_case"
    t.integer  "delivered_case"
    t.datetime "sent_start_at"
    t.datetime "sent_end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mail_magazines", ["deleted_at"], :name => "index_mail_magazines_on_deleted_at"

  create_table "mail_templates", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "header"
    t.text     "footer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mail_templates", ["deleted_at"], :name => "index_mail_templates_on_deleted_at"

  create_table "mails", :force => true do |t|
    t.string   "from_address"
    t.string   "to_address"
    t.text     "message"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mails", ["deleted_at"], :name => "index_mails_on_deleted_at"

  create_table "mobile_carriers", :force => true do |t|
    t.string   "name"
    t.string   "jpmobile_class"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mobile_carriers", ["deleted_at"], :name => "index_mobile_carriers_on_deleted_at"
  add_index "mobile_carriers", ["position"], :name => "index_mobile_carriers_on_position"

  create_table "mobile_devices", :force => true do |t|
    t.integer  "mobile_carrier_id"
    t.string   "device_name"
    t.string   "user_agent"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "mobile_devices", ["deleted_at"], :name => "index_mobile_devices_on_deleted_at"

  create_table "new_informations", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.string   "url"
    t.text     "body"
    t.boolean  "new_window"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "new_informations", ["deleted_at"], :name => "index_new_informations_on_deleted_at"
  add_index "new_informations", ["position"], :name => "index_new_informations_on_position"

  create_table "occupations", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "occupations", ["deleted_at"], :name => "index_occupations_on_deleted_at"
  add_index "occupations", ["position"], :name => "index_occupations_on_position"

  create_table "order_deliveries", :force => true do |t|
    t.integer  "order_id"
    t.text     "message"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_name_kana"
    t.string   "first_name_kana"
    t.string   "email"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.integer  "prefecture_id"
    t.string   "address_city"
    t.string   "address_detail"
    t.integer  "sex"
    t.date     "birthday"
    t.string   "deliv_family_name"
    t.string   "deliv_first_name"
    t.string   "deliv_family_name_kana"
    t.string   "deliv_first_name_kana"
    t.string   "deliv_tel01"
    t.string   "deliv_tel02"
    t.string   "deliv_tel03"
    t.string   "deliv_fax01"
    t.string   "deliv_fax02"
    t.string   "deliv_fax03"
    t.string   "deliv_zipcode01"
    t.string   "deliv_zipcode02"
    t.integer  "deliv_pref_id"
    t.string   "deliv_address_city"
    t.string   "deliv_address_detail"
    t.integer  "subtotal"
    t.integer  "discount"
    t.integer  "deliv_fee"
    t.integer  "charge"
    t.integer  "use_point"
    t.integer  "add_point"
    t.integer  "total"
    t.integer  "payment_total"
    t.integer  "delivery_trader_id"
    t.integer  "delivery_time_id"
    t.text     "note"
    t.integer  "status"
    t.datetime "commit_date"
    t.string   "cell01"
    t.string   "cell02"
    t.string   "cell03"
    t.integer  "payment_id"
    t.integer  "occupation_id"
    t.integer  "address_select"
    t.integer  "settlement_id"
    t.datetime "shipped_at"
    t.datetime "delivery_completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "order_deliveries", ["deleted_at"], :name => "index_order_deliveries_on_deleted_at"
  add_index "order_deliveries", ["deliv_pref_id"], :name => "index_order_deliveries_on_deliv_pref_id"
  add_index "order_deliveries", ["delivery_time_id"], :name => "index_order_deliveries_on_delivery_time_id"
  add_index "order_deliveries", ["delivery_trader_id"], :name => "index_order_deliveries_on_delivery_trader_id"
  add_index "order_deliveries", ["occupation_id"], :name => "index_order_deliveries_on_occupation_id"
  add_index "order_deliveries", ["order_id"], :name => "index_order_deliveries_on_order_id"
  add_index "order_deliveries", ["payment_id"], :name => "index_order_deliveries_on_payment_id"
  add_index "order_deliveries", ["prefecture_id"], :name => "index_order_deliveries_on_prefecture_id"

  create_table "order_details", :force => true do |t|
    t.integer  "product_id"
    t.integer  "classcategory_id1"
    t.integer  "classcategory_id2"
    t.string   "product_name"
    t.string   "product_code"
    t.string   "style_name1"
    t.string   "style_name2"
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "point_rate"
    t.integer  "product_category_id"
    t.integer  "order_delivery_id"
    t.integer  "product_style_id"
    t.integer  "position"
    t.string   "style_category_name1"
    t.string   "style_category_name2"
    t.integer  "tax_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "order_details", ["classcategory_id1"], :name => "index_order_details_on_classcategory_id1"
  add_index "order_details", ["classcategory_id2"], :name => "index_order_details_on_classcategory_id2"
  add_index "order_details", ["deleted_at"], :name => "index_order_details_on_deleted_at"
  add_index "order_details", ["order_delivery_id"], :name => "index_order_details_on_order_delivery_id"
  add_index "order_details", ["position"], :name => "index_order_details_on_position"
  add_index "order_details", ["product_category_id"], :name => "index_order_details_on_product_category_id"
  add_index "order_details", ["product_id"], :name => "index_order_details_on_product_id"
  add_index "order_details", ["product_style_id"], :name => "index_order_details_on_product_style_id"

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.string   "code"
    t.datetime "received_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "retailer_id", :default => 1
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["deleted_at"], :name => "index_orders_on_deleted_at"

  create_table "payments", :force => true do |t|
    t.string   "name"
    t.integer  "lower_limit"
    t.integer  "upper_limit"
    t.integer  "resource_id"
    t.integer  "fee"
    t.integer  "delivery_trader_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "payments", ["deleted_at"], :name => "index_payments_on_deleted_at"
  add_index "payments", ["delivery_trader_id"], :name => "index_payments_on_delivery_trader_id"
  add_index "payments", ["position"], :name => "index_payments_on_position"
  add_index "payments", ["resource_id"], :name => "index_payments_on_resource_id"

  create_table "prefectures", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "prefectures", ["deleted_at"], :name => "index_prefectures_on_deleted_at"
  add_index "prefectures", ["position"], :name => "index_prefectures_on_position"

  create_table "privacies", :force => true do |t|
    t.text     "content_collect"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.text     "content_collect_mobile"
    t.text     "content_privacy"
    t.text     "content_privacy_mobile"
  end

  add_index "privacies", ["deleted_at"], :name => "index_privacies_on_deleted_at"

  create_table "product_access_logs", :force => true do |t|
    t.integer  "product_id"
    t.string   "session_id"
    t.integer  "customer_id"
    t.boolean  "docomo_flg"
    t.boolean  "send_flg"
    t.boolean  "complete_flg"
    t.string   "ident"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "product_access_logs", ["deleted_at"], :name => "index_product_access_logs_on_deleted_at"

  create_table "product_statuses", :force => true do |t|
    t.integer  "product_id"
    t.integer  "status_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "product_statuses", ["deleted_at"], :name => "index_product_statuses_on_deleted_at"
  add_index "product_statuses", ["position"], :name => "index_product_statuses_on_position"
  add_index "product_statuses", ["status_id"], :name => "index_product_statuses_on_status_id"

  create_table "product_styles", :force => true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.string   "code"
    t.integer  "style_category_id1"
    t.integer  "style_category_id2"
    t.integer  "position"
    t.integer  "actual_count"
    t.integer  "purchased_count"
    t.integer  "scheduled_count"
    t.integer  "orderable_count"
    t.integer  "broken_count"
    t.integer  "sell_price"
    t.datetime "sale_start_at"
    t.datetime "sale_end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "manufacturer_id"
  end

  add_index "product_styles", ["deleted_at"], :name => "index_product_styles_on_deleted_at"
  add_index "product_styles", ["position"], :name => "index_product_styles_on_position"
  add_index "product_styles", ["product_id"], :name => "index_product_styles_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.boolean  "permit"
    t.boolean  "no_limit_flag"
    t.text     "url"
    t.text     "introduction"
    t.text     "description"
    t.text     "key_word"
    t.integer  "style_id"
    t.integer  "price"
    t.integer  "small_resource_id"
    t.integer  "medium_resource_id"
    t.integer  "large_resource_id"
    t.integer  "sell_limit"
    t.integer  "point_granted_rate"
    t.integer  "category_id"
    t.text     "size_txt"
    t.text     "material"
    t.text     "origin_country"
    t.text     "weight"
    t.text     "arrival_date"
    t.text     "other"
    t.text     "small_resource_comment"
    t.text     "medium_resource_comment"
    t.text     "large_resource_comment"
    t.text     "free_comment"
    t.integer  "delivery_dates"
    t.boolean  "have_product_style"
    t.datetime "sale_start_at"
    t.datetime "sale_end_at"
    t.datetime "public_start_at"
    t.datetime "public_end_at"
    t.datetime "arrival_expected_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "supplier_id",             :default => 1
    t.integer  "retailer_id",             :default => 1
  end

  add_index "products", ["deleted_at"], :name => "index_products_on_deleted_at"
  add_index "products", ["large_resource_id"], :name => "index_products_on_large_resource_id"
  add_index "products", ["medium_resource_id"], :name => "index_products_on_medium_resource_id"
  add_index "products", ["small_resource_id"], :name => "index_products_on_small_resource_id"
  add_index "products", ["style_id"], :name => "index_products_on_style_id"

  create_table "question_answers", :force => true do |t|
    t.integer  "questionnaire_answer_id"
    t.integer  "question_id"
    t.integer  "question_choice_id"
    t.integer  "question_position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answer"
    t.datetime "deleted_at"
  end

  add_index "question_answers", ["deleted_at"], :name => "index_question_answers_on_deleted_at"
  add_index "question_answers", ["question_choice_id"], :name => "index_question_answers_on_question_choice_id"
  add_index "question_answers", ["question_id"], :name => "index_question_answers_on_question_id"
  add_index "question_answers", ["questionnaire_answer_id"], :name => "index_question_answers_on_questionnaire_answer_id"

  create_table "question_choices", :force => true do |t|
    t.string   "content"
    t.integer  "format"
    t.integer  "question_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "question_choices", ["deleted_at"], :name => "index_question_choices_on_deleted_at"
  add_index "question_choices", ["position"], :name => "index_question_choices_on_position"
  add_index "question_choices", ["question_id"], :name => "index_question_choices_on_question_id"

  create_table "questionnaire_answers", :force => true do |t|
    t.string   "customer_family_name"
    t.string   "customer_first_name"
    t.string   "customer_family_name_kana"
    t.string   "customer_first_name_kana"
    t.string   "prefecture_name"
    t.string   "address_city"
    t.string   "address_details"
    t.string   "email"
    t.integer  "customer_id"
    t.string   "zipcode02"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questionnaire_id"
    t.string   "questionnaire_name"
    t.string   "zipcode01"
    t.datetime "deleted_at"
  end

  add_index "questionnaire_answers", ["customer_id"], :name => "index_questionnaire_answers_on_customer_id"
  add_index "questionnaire_answers", ["deleted_at"], :name => "index_questionnaire_answers_on_deleted_at"
  add_index "questionnaire_answers", ["questionnaire_id"], :name => "index_questionnaire_answers_on_questionnaire_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.boolean  "operation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "questionnaires", ["deleted_at"], :name => "index_questionnaires_on_deleted_at"

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.integer  "questionnaire_id"
    t.integer  "position"
    t.integer  "question_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "questions", ["deleted_at"], :name => "index_questions_on_deleted_at"
  add_index "questions", ["position"], :name => "index_questions_on_position"
  add_index "questions", ["question_choice_id"], :name => "index_questions_on_question_choice_id"
  add_index "questions", ["questionnaire_id"], :name => "index_questions_on_questionnaire_id"

  create_table "recall_details", :force => true do |t|
    t.integer  "recall_id"
    t.integer  "order_detail_id"
    t.integer  "status"
    t.integer  "reason"
    t.integer  "quantity"
    t.integer  "price"
    t.text     "note"
    t.datetime "recalled_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "recalls", :force => true do |t|
    t.string   "code"
    t.integer  "order_delivery_id"
    t.boolean  "count_up"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "recommend_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "recommend_products", ["deleted_at"], :name => "index_recommend_products_on_deleted_at"
  add_index "recommend_products", ["position"], :name => "index_recommend_products_on_position"
  add_index "recommend_products", ["product_id"], :name => "index_recommend_products_on_product_id"

  create_table "recommend_xmls", :force => true do |t|
    t.string   "recommend_id"
    t.string   "name"
    t.string   "url"
    t.string   "categroy"
    t.string   "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "product_id"
    t.integer  "request_type"
  end

  create_table "recommends", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "request_type"
  end

  create_table "resource_datas", :force => true do |t|
    t.binary   "content"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "resource_datas", ["resource_id"], :name => "index_resource_datas_on_resource_id"

  create_table "retailers", :force => true do |t|
    t.string   "name"
    t.string   "name_kana"
    t.string   "corp_name"
    t.string   "corp_name_kana"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.string   "address_city"
    t.string   "address_details"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.string   "businesstime"
    t.string   "mail_shop"
    t.string   "mail_faq"
    t.string   "mail_sender"
    t.string   "mail_admin"
    t.text     "trade_item"
    t.text     "introduction"
    t.integer  "prefecture_id"
    t.integer  "resource_id"
    t.integer  "menu_resource_id"
  end

  create_table "return_items", :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "product_id"
    t.integer  "product_style_id"
    t.datetime "returned_at"
    t.integer  "returned_count"
    t.text     "comment"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seos", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "description"
    t.string   "keywords"
    t.integer  "page_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "seos", ["page_type"], :name => "index_seos_on_page_type"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "name_kana"
    t.string   "corp_name"
    t.string   "corp_name_kana"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.string   "address_city"
    t.string   "address_details"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.string   "businesstime"
    t.string   "mail_shop"
    t.string   "mail_faq"
    t.string   "mail_sender"
    t.string   "mail_admin"
    t.text     "trade_item"
    t.text     "introduction"
    t.integer  "prefecture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "point_granted_rate"
    t.integer  "point_at_admission"
  end

  add_index "shops", ["deleted_at"], :name => "index_shops_on_deleted_at"
  add_index "shops", ["prefecture_id"], :name => "index_shops_on_prefecture_id"

  create_table "statuses", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "statuses", ["deleted_at"], :name => "index_statuses_on_deleted_at"
  add_index "statuses", ["product_id"], :name => "index_statuses_on_product_id"

  create_table "stock_histories", :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "product_id"
    t.integer  "product_style_id"
    t.datetime "moved_at"
    t.integer  "storaged_count"
    t.integer  "orderable_count"
    t.integer  "orderable_adjustment"
    t.integer  "actual_count"
    t.integer  "actual_adjustment"
    t.integer  "broken_count"
    t.integer  "broken_adjustment"
    t.text     "comment"
    t.integer  "stock_type"
    t.datetime "deleted_at"
  end

  add_index "stock_histories", ["deleted_at"], :name => "index_stock_histories_on_deleted_at"
  add_index "stock_histories", ["product_id"], :name => "index_stock_histories_on_product_id"
  add_index "stock_histories", ["product_style_id"], :name => "index_stock_histories_on_product_style_id"

  create_table "stock_tables", :force => true do |t|
    t.datetime "target_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.boolean  "count_fixed"
  end

  add_index "stock_tables", ["deleted_at"], :name => "index_stock_tables_on_deleted_at"

  create_table "style_categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "style_categories", ["deleted_at"], :name => "index_style_categories_on_deleted_at"
  add_index "style_categories", ["position"], :name => "index_style_categories_on_position"
  add_index "style_categories", ["style_id"], :name => "index_style_categories_on_style_id"

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "retailer_id", :default => 1
  end

  add_index "styles", ["deleted_at"], :name => "index_styles_on_deleted_at"
  add_index "styles", ["position"], :name => "index_styles_on_position"

  create_table "sub_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "medium_resource_id"
    t.integer  "large_resource_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "no"
  end

  add_index "sub_products", ["deleted_at"], :name => "index_sub_products_on_deleted_at"
  add_index "sub_products", ["large_resource_id"], :name => "index_sub_products_on_large_resource_id"
  add_index "sub_products", ["medium_resource_id"], :name => "index_sub_products_on_medium_resource_id"
  add_index "sub_products", ["product_id"], :name => "index_sub_products_on_product_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "zipcode01"
    t.string   "zipcode02"
    t.integer  "prefecture_id"
    t.string   "address_city"
    t.string   "address_detail"
    t.string   "tel01"
    t.string   "tel02"
    t.string   "tel03"
    t.string   "fax01"
    t.string   "fax02"
    t.string   "fax03"
    t.string   "contact_name"
    t.string   "email"
    t.integer  "percentage"
    t.integer  "tax_rule"
    t.text     "free_comment"
    t.datetime "deleted_at"
    t.integer  "retailer_id",    :default => 1
  end

  add_index "suppliers", ["deleted_at"], :name => "index_suppliers_on_deleted_at"
  add_index "suppliers", ["name"], :name => "index_suppliers_on_name"

  create_table "systems", :force => true do |t|
    t.integer  "tax"
    t.integer  "tax_rule"
    t.integer  "free_delivery_rule"
    t.integer  "point_rate"
    t.integer  "regist_point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buying_rule"
    t.datetime "deleted_at"
    t.boolean  "supplier_use_flag",                         :default => false
    t.boolean  "googleanalytics_use_flag",                  :default => false
    t.string   "googleanalytics_account_num", :limit => 20
    t.text     "tracking_code"
    t.integer  "googleanalytics_select_code",               :default => 0
  end

  add_index "systems", ["deleted_at"], :name => "index_systems_on_deleted_at"

  create_table "zips", :force => true do |t|
    t.string   "zipcode01",       :limit => 3
    t.string   "zipcode02",       :limit => 4
    t.string   "prefecture_name"
    t.string   "address_city"
    t.string   "address_details"
    t.integer  "prefecture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "isolation_type"
    t.boolean  "can_daibiki"
  end

  add_index "zips", ["deleted_at"], :name => "index_zips_on_deleted_at"
  add_index "zips", ["prefecture_id"], :name => "index_zips_on_prefecture_id"
  add_index "zips", ["zipcode01", "zipcode02"], :name => "index_zips_on_zipcode01_and_zipcode02"

end
