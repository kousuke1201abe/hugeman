class Event < ApplicationRecord
  belongs_to :nightclub
  belongs_to :user
  has_many :images
  has_many :tweets
  has_many :organizers
  has_many :artist_identifyings
  has_many :artists, through: :artist_identifyings
  has_one :publishing, dependent: :destroy

  delegate :name, prefix: true, to: :nightclub

  validates :name, :tag, :start_at, :end_at, presence: true

  def total_count
    Event.published.count
  end

  scope :published, -> do
    joins(:publishing)
  end

  scope :unpublished, -> do
    left_joins(:publishing)
      .where(publishing: { id: nil })
  end

  scope :archived, -> do
    where(arel_attribute(:end_at).lt Time.zone.now)
  end

  scope :scheduled, -> do
    where(arel_attribute(:start_at).gt Time.zone.now)
  end

  scope :featured, -> do
    where(arel_attribute(:end_at).gt Time.zone.now).where(arel_attribute(:start_at).lt Time.zone.now)
  end
end
