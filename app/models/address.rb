class Address < ActiveRecord::Base
  self.table_name = "address"
  has_many :customer
  has_many :staff
  has_many :store
  belongs_to :city
end
