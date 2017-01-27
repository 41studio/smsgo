class AddCascadeMessagesUsers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :messages, :users
    add_foreign_key :messages, :users, on_delete: :cascade, index: true
  end
end
