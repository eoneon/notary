class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
end
