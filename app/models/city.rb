class City < ActiveRecord::Base
  self.table_name = "city"
  has_many :address
  belongs_to :country
end
