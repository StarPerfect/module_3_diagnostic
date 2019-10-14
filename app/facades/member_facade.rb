class MemberFacade
  def initialize
    @service = PotterApiService.new
  end

  def members
    binding.pry
    @service.get_member_data.map do |data|
      Member.new(data)
    end
  end
end
