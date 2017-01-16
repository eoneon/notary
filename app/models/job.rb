class Job < ActiveRecord::Base
  belongs_to :user
  has_many :locations, as: :locatable, dependent: :destroy
  has_many :people, as: :personable, dependent: :destroy
  has_many :line_items, dependent: :destroy

  def self.model_name
    ActiveModel::Name.new(self, nil, "Job")
  end

  # def self.select_options
  #   descendants.map{ |c| c.to_s }.sort
  # end
end
