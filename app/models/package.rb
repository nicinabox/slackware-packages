class Package < ActiveRecord::Base
  has_many :versions, autosave: true

  validates :name, uniqueness: true
end
