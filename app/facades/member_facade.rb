class MemberFacade
  def initialize
    @service = PotterApiService.new
  end

  def members
    @service.get_member_data do |data|
      Member.new(data)
    end
  end
end
