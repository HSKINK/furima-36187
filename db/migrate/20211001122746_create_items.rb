class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :product,     null: false
      t.text        :description, null: false
      t.integer     :category_id, null: false
      t.integer     :content_id,  null: false
      t.integer     :charge_id,   null: false
      t.integer     :area_id,     null: false
      t.integer     :ship_id,     null: false
      t.integer     :price,       null: false
      t.references  :user,        null: false, foreign_ket: true
      t.timestamps
    end
  end
end
