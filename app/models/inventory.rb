class Inventory < ActiveRecord::Base
  self.table_name = "inventory"
  has_many :rentals
  belongs_to :film
  belongs_to :store
end
