class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.integer :assign_id
      t.string :message
      t.string :status

      t.timestamps
    end
  end
end
