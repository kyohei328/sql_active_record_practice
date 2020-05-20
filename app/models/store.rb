class Store < ActiveRecord::Base
  self.table_name = "store"
  has_many :customers
  has_many :inventories
  has_many :staffs
  belongs_to :address
  belongs_to :manager_staff, class_name: 'Staff'
end
