class Payment < ActiveRecord::Base
  self.table_name = "payment"
  belongs_to :customer
  belongs_to :rental
  belongs_to :staff
end
