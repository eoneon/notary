class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true
  validates :phone_number, presence: true                  
end
