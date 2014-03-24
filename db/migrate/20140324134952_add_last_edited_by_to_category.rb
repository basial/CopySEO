class AddLastEditedByToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :last_edited_by, :integer
  end
end
