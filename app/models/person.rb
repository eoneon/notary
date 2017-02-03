class Person < ActiveRecord::Base
  belongs_to :personable, polymorphic: true
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :emails, as: :emailable, dependent: :destroy
  has_many :jobs_as_biller, as: :billee

  validates :first_name, length: {minimum: 1, maximum: 100}, presence: true
  validates :last_name, length: {minimum: 1, maximum: 100}, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
