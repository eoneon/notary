class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.role ||= :member }
  before_save { self.email = email.downcase if email.present? }
  validates :first_name, length: {minimum: 1, maximum: 100}, presence: true
  validates :last_name, length: {minimum: 1, maximum: 100}, presence: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  enum role: [:member, :admin]

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
