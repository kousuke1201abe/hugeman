class Event < ApplicationRecord
  belongs_to :nightclub
  has_many :organizers
  has_many :images
  has_many :tweets
end
