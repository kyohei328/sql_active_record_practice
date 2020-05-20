class Inventory < ActiveRecord::Base
  self.table_name = "inventory"
  has_many :rental
  belongs_to :film
  belongs_to :store
end
