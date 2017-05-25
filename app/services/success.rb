class Success < Response
  attr_reader :data

  def initialize(data)
    @data = data
  end
  
  def success?
    true
  end
end