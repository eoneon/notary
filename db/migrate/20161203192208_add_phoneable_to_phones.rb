class AddPhoneableToPhones < ActiveRecord::Migration
  def change
    add_reference :phones, :phoneable, polymorphic: true, index: true
  end
end
