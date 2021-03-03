class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :zip_code,   null: false
      t.string   :city,   null: false
      t.string   :street_number,   null: false
      t.string   :building
      t.string   :phone_number,   null: false
      t.integer   :prefecture_id,   null: false
      t.timestamps  
      t.references :purchaser,           null: false, foreign_key: true
    end
  end
end