class Staff < ActiveRecord::Base
  self.table_name = "staff"
  has_many :payments
  has_many :rentals
  has_many :stores
  belongs_to :address
  belongs_to :store
end
