require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'

# We don't give instances IDs, the repository will.
leo = Patient.new(name: 'Leo')
yoshio = Patient.new(name: 'Yoshio')
noah = Patient.new(name: 'Noah')

vip = Room.new(capacity: 2)
general = Room.new(capacity: 20)

# vip.add_patient(leo)
# vip.add_patient(yoshio)
# vip.add_patient(noah)
# general.add_patient(noah)
# p vip
# p general
room_csv_file_path = 'data/room.csv'
patient_csv_file_path = 'data/patients.csv'
room_repository = RoomRepository.new(room_csv_file_path)
patient_repository = PatientRepository.new(patient_csv_file_path, room_repository)
# patient_repository.add(leo)
# patient_repository.add(yoshio)
# patient_repository.add(noah)
justin = Patient.new(name: 'justin')
patient_repository.add(justin)
# p patient_repository
