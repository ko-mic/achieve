# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do |n|
    name  = Faker::Name.name
    email = SecureRandom.uuid + "@achievetestingday08.com"
    password = "day08test"
    uid = "day08test" + SecureRandom.uuid
    
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                uid: uid)

    title = "seeds-#{n+1}"
    content = "テストデータ#{n+1}"

    Blog.create!(title: title,
                content: content,
                user_id: n+1)
end