class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons, id: false do |t|
    	t.string :code

      t.timestamps
    end

    add_index :coupons, :code, unique: true
  end
end
