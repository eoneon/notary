class PackageJob < Job
  def document_fee
    0
  end

  def package_list
    self.line_items.where(itemizable_type: "Package")
  end

  def service_list
    self.line_items.where(itemizable_type: "Service")
  end
end
