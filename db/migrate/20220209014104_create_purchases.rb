class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :type
      t.string :date
      t.string :value
      t.string :document
      t.string :card
      t.string :time
      t.string :store_name
      t.string :store_owner

      t.timestamps
    end
  end
end
