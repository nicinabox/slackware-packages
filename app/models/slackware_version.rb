require 'slapp'
require 'httparty'

class SlackwareVersion < ActiveRecord::Base
  validates :version, uniqueness: true
  has_many :versions, dependent: :delete_all
end
