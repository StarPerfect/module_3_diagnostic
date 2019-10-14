class Member
  attr_reader :name, :role, :house, :patronus

  def initialize(data = {})
    @name = data[:name]
    @house = data[:house]
    @role= data[:role] || 'none'
    @patronus= data[:patronus] || 'none'
  end
end
