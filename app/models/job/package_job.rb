class PackageJob < Job
  after_initialize do
    self.billable_type = 'Company'
  end

  before_save do
    if self.persisted? && self.changed_attributes.include?(:type)
      DocumentLineItem.where(job: self).destroy_all
    end
  end

  def document_fee
    0
  end

  def job_packages
    self.line_items.where(itemizable_type: "Package")
  end

  def job_services
    self.line_items.where(itemizable_type: "Service")
  end
end
