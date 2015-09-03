class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.integer :telephone
      t.boolean :is_active
      t.integer :contact_id

      t.timestamps
    end
    add_index :addresses, :contact_id, unique: true
  end
end
