class Job < ActiveRecord::Base
  belongs_to :user
  has_many :locations, as: :locatable, dependent: :destroy
  has_many :people, as: :personable, dependent: :destroy
  has_many :line_items, dependent: :destroy
  belongs_to :company

  def self.model_name
    ActiveModel::Name.new(self, nil, "Job")
  end
end
