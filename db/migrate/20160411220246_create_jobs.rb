class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :company_id 
      t.string :title 
      t.text :requirements 
      t.text :description 
      t.integer :salary 
      t.timestamps
    end
  end
end
