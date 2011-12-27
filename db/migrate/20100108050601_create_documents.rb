class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :user_id
      t.integer :case_id
      t.string :name
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
