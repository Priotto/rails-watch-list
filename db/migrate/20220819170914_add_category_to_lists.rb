class AddCategoryToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :fieldname, :string
  end
end
