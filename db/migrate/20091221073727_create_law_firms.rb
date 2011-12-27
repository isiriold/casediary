class CreateLawFirms < ActiveRecord::Migration
  def self.up
    create_table :law_firms do |t|
      t.string :firm_name
      t.text :address
      t.string :contact_person
      t.string :phone_number
      t.string :mobile
      t.string :mail
      t.string :website
      t.timestamps
    end
  end

  def self.down
    drop_table :law_firms
  end
end
