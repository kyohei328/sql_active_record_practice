class Language < ActiveRecord::Base
  self.table_name = "language"
  has_many :film
  has_many :film
end
