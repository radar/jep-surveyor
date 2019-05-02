# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add some code to db/seeds.rb that will setup:

# An account called 'Culture Amp'
# A user for this account
# A survey for this account
# A set of questions for this survey
# Another account called 'Coles'
# A user for this account
# A suvey for this account
# A set of questions for this survey

account = Account.create(name: "Culture Amp")
user = account.users.create(email: "a@a.com", password: "aaa")
survey = account.surveys.create(name: "survey1")
s1_question_1 = survey.rating_questions.create(title: "s1_question1")
s1_question_2 = survey.rating_questions.create(title: "s1_question2")
s1_question_3 = survey.rating_questions.create(title: "s1_question3")

account2 = Account.create(name: "Coles")
user2 = account2.users.create(email: "b@b.com", password: "bbb")
survey2 = account2.surveys.create(name: "survey2")
s2_question_1 = survey2.rating_questions.create(title: "s2_question1")
s2_question_2 = survey2.rating_questions.create(title: "s2_question2")
s2_question_3 = survey2.rating_questions.create(title: "s2_question3")


