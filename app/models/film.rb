class Film < ActiveRecord::Base
  self.table_name = "film"
  has_many :film_actors
  has_many :film_categories
  has_many :inventories
  belongs_to :language
  belongs_to :original_language, class_name: 'Language'
end
