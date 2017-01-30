class ServiceLineItem < LineItem
  after_initialize do
    self.itemizable_type = 'Service'
  end

  def item_names
    Service.all
  end

  def quantity
    1
  end
end
