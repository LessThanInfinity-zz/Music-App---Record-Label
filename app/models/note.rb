class Note < ActiveRecord::Base
  attr_accessible :content, :track_id

  belongs_to :track
  #belongs_to :user



end
