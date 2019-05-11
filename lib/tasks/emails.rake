namespace :emails do
  desc "TODO"
  task next_lunch_promo: :environment do
    @users.each do |user|
      ApplicationMailer.send_next_lunch_email(user).deliver
    end
  end
end
