class PiecemealJob < Job
  def document_fee
    10
  end

  def service_list
    self.line_items.where(itemizable_type: "Service")
  end
end
