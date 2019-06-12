User.create!(
  name: "admin",
  email: "admin@sun-asterisk.com",
  password: "password",
  password_confirmation: "password",
  role: User.roles[:admin]
)

User.create!(
  name: "supervisor",
  email: "supervisor@sun-asterisk.com",
  password: "password",
  password_confirmation: "password",
  role: User.roles[:supervisor]
)
50.times do |n|
  User.create!(
    name: "supervisor#{n}",
    email: "supervisor#{n}@sun-asterisk.com",
    password: "password",
    password_confirmation: "password",
    role: User.roles[:supervisor]
  )
end
User.create!(
  name: "trainee",
  email: "trainee@sun-asterisk.com",
  password: "password",
  password_confirmation: "password",
  role: User.roles[:trainee]
)
