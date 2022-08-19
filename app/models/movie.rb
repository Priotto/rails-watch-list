class Movie < ApplicationRecord
  has_many :bookmarks #Relação de cardinalidade. Dependent destroy: Se apagar o restaurante as reviews também são deletadas
  validates :title, :overview, uniqueness: true, presence: true
end
