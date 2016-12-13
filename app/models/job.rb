class Job < ActiveRecord::Base
  belongs_to :user
  has_one :locations, as: :locatable, dependent: :destroy
end
