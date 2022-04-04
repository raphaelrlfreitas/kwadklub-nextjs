# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Create Users with Profiles

userData = [
  {
    email: "zangaofpv@gmail.com",
    password: "zangao123",
    password_confirmation: "zangao123",
    username: "zangaofpv",
  }
].freeze


unless User.any?
  userData.each do |user|
    u = User.create!(
      email: user[:email],
      password: user[:password],
      password_confirmation: user[:password_confirmation],
    )

    p = Profile.create!(user_id: u.id, username: user[:username])

    puts ("User and profile created successfully")
  end
end