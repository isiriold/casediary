class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :case_type
      t.string :file_number
      t.string :case_number
      t.date :date_of_filing
      t.date :last_date_for_submission
      t.text :facts_of_the_case
      t.text :opponent_details
      t.string :opponent_advocate
      t.string :our_client
      t.string :judgement_summary
      t.string :status
      t.text :citations
      t.date :first_hearing_date
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :cases
  end
end
