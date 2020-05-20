class FilmCategory < ActiveRecord::Base
  self.table_name = "film_category"
  belongs_to :category
  belongs_to :film
end
