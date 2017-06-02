if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
ChampCalendare.create!(champ_name: 'Гонка на нюрнбургринге', numb: 1, start_date: Date.new(2017,3,22), country:'Германия', place: 'Нюрнбург')
r1 = ChampRacer.create!(sn: 'Шумахер',fn:'Михаель', b_date: Date.new(1968,7,1), country: 'Германия', win_rate: 68)
r2 = ChampRacer.create!(sn: 'Шумахер',fn:'Раэль', b_date: Date.new(1975,6,30), country: 'Германия', win_rate: 38)
Team.create!(name:'Ferrari',champ_racer: r1, champ_racer1: r2, engine_prod: 'Ferrari', numbr1: 1,numbr2: 222, country: 'Германия' )
r3 = ChampRacer.create!(sn: 'Джейсон',fn:'Батон', b_date: Date.new(1980,7,1), country: 'Великобритания', win_rate: 10)
r4 = ChampRacer.create!(sn: 'Льюис',fn:'Хэмилтон', b_date: Date.new(1985,6,30), country: 'Великобритания', win_rate: 42)
Team.create!(name:'Volkswagen',champ_racer: r3, champ_racer1: r4, engine_prod: 'Volkswagen', numbr1: 2,numbr2: 3, country: 'Великобритания' )
