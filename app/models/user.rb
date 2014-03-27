class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable
         
  has_attached_file :avatar, :styles => { :thumb => "100x100>", :medium => "300x300>", :mini => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: /[a-z]*[@][a-z]*.[a-z]*/ }

  def full_name
    if first_name.blank? && last_name.blank?
      "Użytkownik"
    elsif first_name.blank?
      "#{last_name}"
    elsif last_name.blank?
      "#{first_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
