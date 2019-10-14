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
