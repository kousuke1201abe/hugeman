class Event < ApplicationRecord
  belongs_to :nightclub
  belongs_to :user
  has_many :images
  has_many :tweets
  has_many :organizers
  has_many :artist_identifyings
  has_many :artists, through: :artist_identifyings

  delegate :name, prefix: true, to: :nightclub

  def total_count
    Event.count
  end

  scope :finished, -> do
    where(arel_attribute(:end_at).lt Time.zone.now)
  end

  scope :scheduled, -> do
    where(arel_attribute(:start_at).gt Time.zone.now)
  end

  scope :featured, -> do
    where(arel_attribute(:end_at).gt Time.zone.now).where(arel_attribute(:start_at).lt Time.zone.now)
  end
end
