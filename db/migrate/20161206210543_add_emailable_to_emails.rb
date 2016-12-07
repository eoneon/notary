class AddEmailableToEmails < ActiveRecord::Migration
  def change
    add_reference :emails, :emailable, polymorphic: true, index: true
  end
end
