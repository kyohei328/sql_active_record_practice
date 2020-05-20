class Film < ActiveRecord::Base
  self.table_name = "film"
  has_many :film_actors
  has_many :film_category
  has_many :inventory
  belongs_to :language
  belongs_to :language
end
