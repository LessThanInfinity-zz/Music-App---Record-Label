class Album < ActiveRecord::Base
  attr_accessible :name, :recording, :band_id
  validates :recording, :inclusion => ['live', 'studio'] # should work.

  belongs_to :band
  has_many :tracks, :dependent => :destroy
end
