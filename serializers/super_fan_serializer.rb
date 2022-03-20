class SuperFanSerializer < ActiveModel::Serializer
  attributes :id, :name, :years_of_fandom

  has_many :songs
end
