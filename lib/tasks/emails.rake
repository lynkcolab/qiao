namespace :emails do
  desc "TODO"
  task next_lunch_promo: :environment do
    @users.each do |user|
      send_next_lunch_email(user)
    end
  end
end
