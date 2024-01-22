class Patient
  attr_accessor :room, :id
  attr_reader :name

  def initialize(attributes = {})
    # p attributes
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] || nil # INSTANCE
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
  # attr_reader :room
  # def room
  #   @room # instance of a room
  # end

end

# p leo.cure!
# p leo
