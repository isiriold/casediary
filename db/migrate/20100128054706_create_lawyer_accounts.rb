class CreateLawyerAccounts < ActiveRecord::Migration
  def self.up
    create_table :lawyer_accounts do |t|
      t.integer :user_id
      t.decimal :opening_balance,:precision => 14, :scale => 2
      t.decimal :current_balance,:precision => 14, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :lawyer_accounts
  end
end
