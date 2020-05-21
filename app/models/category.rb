class Category < ActiveRecord::Base
  self.table_name = "category"
  has_many :film_categories
  has_many :films, through: :film_categories
end
