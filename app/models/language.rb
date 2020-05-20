class Language < ActiveRecord::Base
  self.table_name = "language"
  has_many :films
  has_many :films
end
