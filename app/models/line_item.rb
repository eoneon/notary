class LineItem < ActiveRecord::Base
  belongs_to :job
  belongs_to :package

  def self.model_name
    ActiveModel::Name.new(self, nil, "LineItem")
  end
end
