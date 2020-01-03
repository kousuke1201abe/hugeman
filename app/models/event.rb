class Event < ApplicationRecord
  belongs_to :nightclub
  has_many :images
end
