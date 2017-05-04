class PiecemealJob < Job
  after_initialize do
    self.billable_type = 'Person'
  end

  before_save do
    if self.persisted? && self.changed_attributes.include?(:type)
      PackageLineItem.where(job: self).destroy_all
    end
  end

  def name
    billable.name
  end

  def job_documents
    self.line_items.where(itemizable_type: "Document")
  end

  def job_services
    self.line_items.where(itemizable_type: "Service")
  end
end
