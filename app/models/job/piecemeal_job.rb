class PiecemealJob < Job
  def document_fee
    10
  end

  def job_documents
    self.line_items.where(itemizable_type: "Package")
  end

  def job_services
    self.line_items.where(itemizable_type: "Service")
  end
end
