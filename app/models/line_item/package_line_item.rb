class PackageLineItem < LineItem  
  after_initialize do
    self.itemizable_type = 'Package'
  end

  def quantity
    1
  end
end
