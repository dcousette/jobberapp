class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id 
      t.integer :job_id
      t.text :interest_reason
      t.string :availability
      t.text :cover_letter
      t.timestamps
    end
  end
end
