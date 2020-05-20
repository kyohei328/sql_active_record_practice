class FilmActor < ActiveRecord::Base
  self.table_name = "film_actor"
  belongs_to :actor
  belongs_to :film
end
