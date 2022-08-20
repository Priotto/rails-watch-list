class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy #Se deletar a lista, os bookmarks também são deletados
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates :name, uniqueness: true, presence: true
end
