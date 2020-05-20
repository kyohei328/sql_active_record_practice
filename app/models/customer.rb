class Customer < ActiveRecord::Base
  self.table_name = "customer"
  has_many :payment
  has_many :rental
  belongs_to :address
  belongs_to :store
end
