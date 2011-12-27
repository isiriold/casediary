class CreateHearings < ActiveRecord::Migration
  def self.up
    create_table :hearings do |t|
      t.integer :case_id
      t.integer :user_id
      t.string :court_hall
      t.date :hearing_date
      t.text :highlights_of_the_hearing
      t.date :next_hearing_date
      t.string :attended_by
      t.string :stage
      t.text :reminder_for_next_hearing

      t.timestamps
    end
  end

  def self.down
    drop_table :hearings
  end
end
