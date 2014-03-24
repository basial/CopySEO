class AddAvatarToCategory < ActiveRecord::Migration
  def self.up
    add_attachment :categories, :avatar
  end

  def self.down
    remove_attachment :categories, :avatar
  end
end
