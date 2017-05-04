class Document < ActiveRecord::Base
  has_many :line_items
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

end
