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
20.times do |n|
  User.create!(
    name: "trainee#{n}",
    email: "trainee#{n}@sun-asterisk.com",
    password: "password",
    password_confirmation: "password",
    role: User.roles[:trainee]
  )
end
Course.create!(
  title: "Batch22_ruby",
  description: "Lorem ipsum",
  created_by: 2,
  status: 1
)
Course.create!(
  title: "Batch23_ruby",
  description: "Lorem ipsum",
  created_by: 2,
  status: 0
)
Course.create!(
  title: "Batch22_php",
  description: "Lorem ipsum",
  created_by: 2,
  status: 0
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
Subject.create!(
  title: "Python",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Django",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Flask",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Java",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "SpringMVC",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "Struts 1",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "NodeJS",
  description: "Lorem ipsum",
  created_by: 2
)
Subject.create!(
  title: "ExpressJS",
  description: "Lorem ipsum",
  created_by: 2
)
