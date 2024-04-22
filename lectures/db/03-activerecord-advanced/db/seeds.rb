require "faker"

puts "Creating 5 doctors..."
5.times do
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "Creating 5 interns..."
5.times do
  Intern.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    doctor: Doctor.all.sample
  )
end

puts "Creating 10 patients..."
10.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..99)
  )
end

puts "Creating 20 consultations..."
20.times do
  Consultation.create(
    doctor: Doctor.all.sample,
    patient: Patient.all.sample
  )
end
