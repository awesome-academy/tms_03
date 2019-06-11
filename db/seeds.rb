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

User.create!(
  name: "trainee",
  email: "trainee@sun-asterisk.com",
  password: "password",
  password_confirmation: "password",
  role: User.roles[:trainee]
)
