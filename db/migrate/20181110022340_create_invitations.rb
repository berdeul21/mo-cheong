class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.datetime :d_day
      t.string :title
      t.string :thumb
      t.text :description
      t.text :directions
      t.string :contact_bride
      t.string :contact_groom
      t.string :contact_other

      t.timestamps
    end
  end
end
