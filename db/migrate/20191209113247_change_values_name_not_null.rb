class ChangeValuesNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :values, :title, false
    change_column_null :values, :content, false
  end
end
