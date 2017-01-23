class LineItem < ActiveRecord::Base
  belongs_to :job
  belongs_to :itemizable, polymorphic: true
  validates :itemizable, presence: true

  def name
    itemizable.name
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "LineItem")
  end
end



# line_items
# id  type                 quantity  fee  job_id  itemizable_id itemizable_type
# 5   package_line_item    1         100  7       1             package
# 6   package_line_item    1         100  7       5             service
#
#
#
# line_item = LineItem.find(5)
#
# Job.find(line_item.job_id).name
# line_item.job.name
#
# line_item.itemizable.name
