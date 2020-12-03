require 'json'
require 'open-uri'

class CallMuseumData
  def self.call(param)
    url = "https://collectionapi.metmuseum.org/public/collection/v1/search?q=#{param}&showOnly=withImage&q=painting"
    data = JSON.parse(open(url).read)
    art = data["objectIDs"][0]

    url_art = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{art}"
    art_data = JSON.parse(open(url_art).read)
    image_title = art_data["title"]
    image_date = art_data["objectDate"]
    image_artist = art_data["artistDisplayName"]
    image_url = art_data["primaryImage"]
    art_url = art_data["objectURL"]
    results = [image_title, image_date, image_artist, image_url, art_url]
  end
end

