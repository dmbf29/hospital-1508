require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1 # new from today
    @room_repository = room_repository
    load_csv if File.exists?(@csv_file_path)
  end

  def add(patient)
    # we need to give the id to the patient
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    # convert the data from the CSV into a ruby instance
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # attributes is acting like a hash
      # we pass the attributes hash into the instance
      # before creating the instance, we need to fix any "non-string" values
      # hash[key] = new_value
      # p attributes
      attributes[:id] = attributes[:id].to_i
      attributes[:cured] = attributes[:cured] == 'true'
      # Tomorrow
      attributes[:room_id] # as a string
      # as the room repo for an instance using the id
      room = @room_repository.find(attributes[:room_id].to_i)
      # then put the instance of the room in the hash
      attributes[:room] = room
      patient = Patient.new(attributes)
      @patients << patient
      @next_id = patient.id + 1
    end
    # we need to make sure we update the @next_id
    # @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end
end
