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
20.times do |n|
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

Course.create!(
  title: "Batch22_ruby",
  description: "Lorem ipsum",
  created_by: 2
)
Course.create!(
  title: "Batch23_ruby",
  description: "Lorem ipsum",
  created_by: 2
)
Course.create!(
  title: "Batch22_php",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Git",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "MySQL",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Ruby",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "PHP",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Rails",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Laravel",
  description: "Lorem ipsum",
  created_by: 2
)
