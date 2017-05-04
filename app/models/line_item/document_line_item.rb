class DocumentLineItem < LineItem
  after_initialize do
    self.itemizable_type = 'Document'
  end

  def item_names
    Document.all
  end

  def document_fee
    10
  end

  def fee
    document_fee * self.quantity.to_i
  end

  # def total
  #   self.line_items.sum(:fee)
  # end
end
