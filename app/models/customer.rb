class Customer < ActiveRecord::Base
  self.table_name = "customer"
  has_many :payments
  has_many :rentals
  belongs_to :address
  belongs_to :store
end
