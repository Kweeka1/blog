class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, index: true, foreign_key: { to_table: :users }
  end
end
