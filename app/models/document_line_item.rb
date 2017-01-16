class DocumentLineItem < LineItem
  def fee
    self.job.document_fee
  end

  def total
    self.line_items.sum(:fee)
  end
end
