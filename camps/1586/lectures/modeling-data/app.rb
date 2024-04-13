### HOSPITAL ###

# 1. Define models

class Patient
  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cure!
    @cured = true
  end
end

class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.length == @capacity
  end
end

# 2. Try to assign (IRB)

patient = Patient.new(name: "Bob")
patient.room # => NoMethodError!

# 3. Let's add the association between Patient and Room

class Patient
  attr_accessor :room
  # [...]
end

class Room
  # [...]
  def add_patient(patient)
    raise StandardError, "Room is full!" if full?
    patient.room = self
    @patients << patient
  end
end

# 4. Try to assign (IRB)

patient = Patient.new(name: "Bob")
room = Room.new(capacity: 2)
room.add_patient(patient)
patient.room # => #<Room...>

# 5. The repositories can handle autoincrementation

class Room
  attr_accessor :id
  # ...
end

class Patient
  attr_accessor :id
  # ...
end

class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i # Convert column to Integer
      row[:cured] = row[:cured] == "true" # Convert column to boolean
      @patients << Patient.new(row)
    end

    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  # ...same as PatientRepository
end
