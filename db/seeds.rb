START_USERS = [
  {
    name: '店長',
    ptj: false,
    email: 'manager@shiftem.com',
    password: 'haruka0415',
    password_confirmation: 'haruka0415',
    admin: true
  },
  {
    name: 'はるか',
    ptj: false,
    email: 'haruka@shiftem.com',
    password: 'haruka0415',
    password_confirmation: 'haruka0415',
    admin: true
  },
  {
    name: 'しおり',
    ptj: true,
    email: 'shiori@shiftem.com',
    password: 'shiori1022',
    password_confirmation: 'shiori1022',
    admin: false
  },
  {
    name: 'まり',
    ptj: true,
    email: 'mari@shiftem.com',
    password: 'mari0429',
    password_confirmation: 'mari0429',
    admin: false
  },
  {
    name: 'れいじ',
    ptj: true,
    email: 'reiji@shiftem.com',
    password: 'reiji0303',
    password_confirmation: 'reiji0303',
    admin: false
  },
  {
    name: 'とくこ',
    ptj: true,
    email: 'tokuko@shiftem.com',
    password: 'tokuko0207',
    password_confirmation: 'tokuko0207',
    admin: false
  },
]
START_USERS.each do |user|
  User.create!(user)
end
