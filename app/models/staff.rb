class Staff < ActiveRecord::Base
  self.table_name = "staff"
  has_many :payment
  has_many :rental
  has_many :store
  belongs_to :address
  belongs_to :store
end
