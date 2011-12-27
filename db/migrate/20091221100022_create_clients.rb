class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.integer :law_firm_id
      t.integer :referer_id
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :mobile_number
      t.string :mail
      t.text :other_details
      t.string :client_type
      t.string :father
      t.date :dob
      t.string :contact_person_name
      t.string :contact_person_designation
      t.string :contact_person_phone_number
      t.string :authorized_person_name
      t.string :authorized_person_designation
      t.string :authorized_person_phone_number
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
