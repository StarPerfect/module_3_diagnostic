class SearchController < ApplicationController
  def index
    conn = Faraday.new(
          url: 'https://www.potterapi.com/v1/',
          params: {key: ENV['potter_key'], house: 'Gryffindor', orderOfThePhoenix: 'true'},
          headers: {'Content-Type' => 'application/json'}
          )

    json_response = conn.get('characters')
    data = JSON.parse(json_response.body, symbolize_names: true)
  end
end
