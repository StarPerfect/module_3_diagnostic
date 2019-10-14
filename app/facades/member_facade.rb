class MemberFacade
  def initialize(house)
    @house = house
    @service = PotterApiService.new
  end

  def members
    @service.get_member_data.map do |data|
      Member.new(data)
    end
  end
end
