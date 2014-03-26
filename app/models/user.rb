class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable
         
  has_attached_file :avatar, :styles => { :thumb => "100x100>", :medium => "300x300>", :mini => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # validates :email, :first_name, :last_name, presence: true
  # validates :first_name, :last_name, format: /@/ 
  # validates :email, uniqueness: true

  def full_name
    if first_name.blank? && last_name.blank?
      "Użytkownik"
    else
      "#{first_name} #{last_name}"
    end
  end
end
