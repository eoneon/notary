class Company < ActiveRecord::Base
  has_one :job

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }
end
