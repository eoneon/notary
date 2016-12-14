class Person < ActiveRecord::Base
  belongs_to :personable, polymorphic: true

  validates :first_name, length: {minimum: 1, maximum: 100}, presence: true
  validates :last_name, length: {minimum: 1, maximum: 100}, presence: true
  
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
