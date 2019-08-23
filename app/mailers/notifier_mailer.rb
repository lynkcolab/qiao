class NotifierMailer < ApplicationMailer

    def welcome(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to Qiao!")
        
        #NotifierMailer.welcome(@user).deliver_now
    end

    def send_next_lunch_email
        for user in User.all
          @user = user
          mail(to: @user.email, subject: "Join the next lunch - Qiao")
        end
    end

    def joined_lunch(user)
        @user = user
        mail(to: @user.email, subject: "You have joined a Qiao lunch!")

        #NotifierMailer.joined_lunch(@user).deliver_now
    end
end