class PiecemealJob < Job
  after_initialize do
    self.billable_type = 'Person'
  end

  def document_fee
    10
  end

  def job_documents
    self.line_items.where(itemizable_type: "Document")
  end

  def job_services
    self.line_items.where(itemizable_type: "Service")
  end
end
