class Room
  attr_reader :capacity

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @capacity = attributes[:capacity] # integer
    @patients = [] # array of patient INSTANCES
  end

  # when you're inside of an instance method, to refer to the instance:
  # vip.add_patient(leo)

  def add_patient(patient)
    if full?
      raise StandardError, 'We are full. go to the street'
    else
      # p self # INSTANCE of the room
      @patients << patient
      patient.room = self # we create ivar @room here
    end
  end

  def full?
    @capacity <= @patients.length
  end
end
