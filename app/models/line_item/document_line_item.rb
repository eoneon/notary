class DocumentLineItem < LineItem
  after_initialize do
    self.itemizable_type = 'Document'
  end

  def item_names
    Document.all
  end
  # def fee
  #   self.job.document_fee
  # end

  def total
    self.line_items.sum(:fee)
  end
end
