class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.text :message
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
