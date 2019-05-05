# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
User.destroy_all
RatingQuestion.destroy_all

puts "Create CA"
ca = Account.create(name:'Culture Amp')
puts "create first user"
user1 = User.create(email:"jody@1.com", password:'123456', account_id: ca)
puts "create survey"
survey1 = Survey.create(name:"CA ever", account_id: ca)

puts "Create Coles"
coles = Account.create(name:'Coles')
puts "creates user2"
user2 = User.create(email:"jody@2.com", password:'123456', account_id: coles)
puts "creates survey2"
survey2 = Survey.create(name:"Coles ever", account_id: coles)

questions = ['What do you think of your boss', 'Are you sure you love this company', 'Why would you do that to your buddy?']

surveys = [survey1, survey2]

puts "create questions for each survey"
surveys.each do |survey|
  questions.each do |question|
    RatingQuestion.create(survey_id: survey, title: question)
  end
end

