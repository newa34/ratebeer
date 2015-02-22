class BeermappingApi
  def self.places_in(city)
    return [] if city.nil? or city.empty?

    city = city.downcase
    Rails.cache.fetch(city, expires_in: 1.minute) { fetch_places_in(city) }
  end

  def self.place(id,city)
    places_in(city).select{ |place| place.id == id }.first
  end

  private

  def self.fetch_places_in(city)
    url = "http://beermapping.com/webservice/loccity/#{key}/"

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(city)}"
    places = response.parsed_response["bmp_locations"]["location"]

    return [] if places.is_a?(Hash) and places['id'].nil?

    places = [places] if places.is_a?(Hash)
    places.inject([]) do | set, place |
      set << Place.new(place)
    end
  end

  def self.key
    "57a7ee503703e55221412324120767eb"
  end
end