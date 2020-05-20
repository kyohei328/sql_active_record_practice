class Address < ActiveRecord::Base
  self.table_name = "address"
  has_many :customers
  has_many :staffs
  has_many :stores
  belongs_to :city
end
