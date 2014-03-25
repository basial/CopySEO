class Category < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def last_contributor
    if (last_edited_by)
      user = User.find(last_edited_by)
      return "#{user.first_name} #{user.last_name}"
    else 
      return false
    end
  end
end
