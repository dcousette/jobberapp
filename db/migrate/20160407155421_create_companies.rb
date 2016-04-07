class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name 
      t.string :address 
      t.string :city
      t.string :state 
      t.timestamps
    end
  end
end
