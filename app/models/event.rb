class Event < ApplicationRecord
  belongs_to :nightclub
  has_many :images
  has_many :tweets
  has_many :organizers
  has_many :artist_identifyings
end
