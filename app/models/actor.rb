class Actor < ActiveRecord::Base
  self.table_name = "actor"
  has_many :film_actors
  has_many :films, through: :film_actors
end
