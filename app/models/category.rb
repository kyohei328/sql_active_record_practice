class Category < ActiveRecord::Base
  self.table_name = "category"
  has_many :film_category
end
