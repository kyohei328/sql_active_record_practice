class Store < ActiveRecord::Base
  self.table_name = "store"
  has_many :customer
  has_many :inventory
  has_many :staff
  belongs_to :address
  belongs_to :staff
end
