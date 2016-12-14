class Job < ActiveRecord::Base
  belongs_to :user
  has_many :locations, as: :locatable, dependent: :destroy
  has_many :person, as: :personable, dependent: :destroy
end
