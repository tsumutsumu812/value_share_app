class AddUserIdToValues < ActiveRecord::Migration[5.2]
  def change
    add_reference :values, :user, foreign_key: true
  end
end
