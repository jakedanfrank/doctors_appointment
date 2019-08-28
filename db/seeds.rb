roles = ["surgeon", "nurse", "patient"]
5.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  5.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name 
    )

    Appointment.create(
      role: roles.sample,
      user_id: user.id,
      doctor_id: doctor.id
    )
  end 
end

puts "Data Seeded"