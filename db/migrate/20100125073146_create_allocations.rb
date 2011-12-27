class CreateAllocations < ActiveRecord::Migration
  def self.up
    create_table :allocations do |t|
      t.integer :user_id
      t.decimal :amount,:precision => 14, :scale => 2
      t.date :date_of_allocation
      t.text :purpose
      t.timestamps
    end
  end

  def self.down
    drop_table :allocations
  end
end
