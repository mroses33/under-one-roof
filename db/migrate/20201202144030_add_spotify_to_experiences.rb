class AddSpotifyToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :spotify_url, :string
  end
end
