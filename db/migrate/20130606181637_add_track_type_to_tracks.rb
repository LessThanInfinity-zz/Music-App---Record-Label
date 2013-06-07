class AddTrackTypeToTracks < ActiveRecord::Migration
  def change
     add_column :tracks, :track_type, :string #what about models?
     add_column :tracks, :lyrics, :text
  end
end
