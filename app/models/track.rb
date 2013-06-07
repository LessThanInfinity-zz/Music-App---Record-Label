class Track < ActiveRecord::Base
  attr_accessible :title, :album_id, :track_type, :lyrics

  belongs_to :album
  has_many :notes
end
