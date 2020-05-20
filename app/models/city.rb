class City < ActiveRecord::Base
  self.table_name = "city"
  has_many :addresses
  belongs_to :country
end
