class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  ROLES = %w[admin siswa]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  has_attached_file :avatar, :styles => { :medium => "40x40>", :thumb => "32x32>", :large => "160X160>" }, :default_url => "avatar/:style/default.jpg"
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  has_many :project
  has_many :member_project
  has_many :activity
  has_many :user_groups
  has_many :post_project
  has_many :comment_project
  has_many :storage
end
