class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email, index: true
      t.string :phone_number, index: true

      t.timestamps
    end
  end
end
