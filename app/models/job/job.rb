class Job < ActiveRecord::Base
  belongs_to :user
  has_many :locations, as: :locatable, dependent: :destroy
  has_many :people, as: :personable, dependent: :destroy
  has_many :line_items, dependent: :destroy
  # belongs_to :company
  belongs_to :billable, polymorphic: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Job")
  end

  def first_signer_last_name
    self.people.first.last_name
  end

  def signers_last_name_first
    signers = []
    self.people.each do |p|
      signers << p.last_name + ", " + p.first_name
    end
    signers.join(" & ")
  end
end
