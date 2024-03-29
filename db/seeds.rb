START_USERS = [
  {
    name: '店長',
    email: 'manager@shiftem.com',
    password: 'haruka0415',
    password_confirmation: 'haruka0415',
    admin: true
  },
  {
    name: 'はるか',
    email: 'haruka@shiftem.com',
    password: 'haruka0415',
    password_confirmation: 'haruka0415',
    admin: true
  },
  {
    name: 'しおり',
    email: 'shiori@shiftem.com',
    password: 'shiori1022',
    password_confirmation: 'shiori1022',
    admin: false
  }
]
START_USERS.each do |user|
  User.create!(user)
end
