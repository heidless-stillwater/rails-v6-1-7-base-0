namespace :members do
  desc "TODO"
  task seed_users: :environment do
    User.destroy_all

    email = "demo@heidless-app-0.com"
    password = "password"
    c_time = Time.now
    user = User.create!(
                  email: email,
                  password: password,
                  password_confirmation: password,
                  confirmed_at: c_time
                )
  end
end
