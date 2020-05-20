class Rental < ActiveRecord::Base
  self.table_name = "rental"
  has_many :payments
  belongs_to :customer
  belongs_to :inventory
  belongs_to :staff
end
