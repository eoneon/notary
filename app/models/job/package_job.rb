class PackageJob < Job
  def document_fee
    0
  end

  def job_packages
    self.line_items.where(itemizable_type: "Package")
  end

  def job_services
    self.line_items.where(itemizable_type: "Service")
  end

  # def company
  #   Company.where(id: self.company_id)
  # end
end
