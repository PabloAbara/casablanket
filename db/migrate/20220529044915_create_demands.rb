class CreateDemands < ActiveRecord::Migration[6.1]
  def change
    create_table :demands do |t|
      t.integer :offer_id
      t.string :message
      t.string :status
      t.integer :response_assign_id
      t.integer :direction

      t.timestamps
    end
  end
end
