class Success < Response
  attr_reader :data

  def initialize(*data)
    @data = data[0] if data.count > 0
  end
  
  def success?
    true
  end
end