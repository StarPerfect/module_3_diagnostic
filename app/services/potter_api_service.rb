class PotterApiService

  def get_member_data
    data = JSON.parse(get_response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(
          url: 'https://www.potterapi.com/v1/',
          params: {key: ENV['potter_key'], house: 'Gryffindor', orderOfThePhoenix: 'true'},
          headers: {'Content-Type' => 'application/json'}
          )
  end

  def get_response
    conn.get('characters')
  end
end

# Postman 200 Ok: https://www.potterapi.com/v1/characters?key=$2a$10$1al58FTKpHYmIRJY8D4yrOihVSuMeghEwO98EgFrRocsFlK3UjQv6&house=Gryffindor&orderOfThePhoenix=true
#
# def members
#   conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
#     faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
#     faraday.adapter Faraday.default_adapter
#   end
#
#   response = conn.get("/congress/v1/members/house/#{state}/current.json")
#
#   JSON.parse(response.body, symbolize_names: true)[:results]
