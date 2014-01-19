class Package < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :versions, autosave: true

  validates :name, uniqueness: true
end
