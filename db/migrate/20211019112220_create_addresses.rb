class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,       null: false
      t.integer     :prefecture_id,     null: false
      t.string      :municipality,      null: false
      t.string      :house_number,      null: false
      t.string      :building_name
      t.string      :telephone_number,  null: false
      t.references  :history,           null: false, foreign_ket: true
      t.timestamps
    end
  end
end
