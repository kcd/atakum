# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Student.count == 0
  Student.create(:first_name => 'seda', :last_name => 'dogan', :email => 'sedadogan@bil.omu.edu.tr', :password => '123456')
  Student.create(:first_name => 'begum', :last_name => 'topyildiz', :email => 'beg@bil.omu.edu.tr', :password => '123456')
  Student.create(:first_name => 'canan', :last_name => 'demirel', :email => 'kcd@bil.omu.edu.tr', :password => '123456')
  Student.create(:first_name => 'tugce', :last_name => 'yesilyurt', :email => 'nty@bil.omu.edu.tr', :password => '123456')
end
