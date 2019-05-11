class ApplicationMailer < ActionMailer::Base
  default from: 'emma.westman@lynkco.com'
  layout 'mailer'

  def send_cal_placeholder_email(user)
    @user = user
    ical = Icalendar::Calendar.new
    e = Icalendar::Event.new
    e.start = DateTime.now.utc
    e.start.icalendar_tzid="UTC" # set timezone as "UTC"
    e.end = (DateTime.now + 1.hour).utc
    e.end.icalendar_tzid="UTC"
    e.organizer "colab@lynkoc.com"
    e.created = DateTime.now
    
    #e.uid = e.url = "#{HOSTNAME.to_s+'/interaction/'+@i.id.to_s}"
    #e.summary "#{INTERACTION_TYPE[@i.itype][0]} with #{@i.company}"
    #e.description <<-EOF
    #{INTERACTION_TYPE[@i.itype][0]} with #{@i.company}%
    #Date: #{@i.start_time.strftime('%e %b %Y')}
   # Time: #{@i.start_time.strftime('%I:%M %p')}
   # EOF
    ical.add_event(e)
    ical.custom_property("METHOD", "REQUEST")
    @user = params[:user]
    @url  = 'http://example.com/login'


    email = mail(to: @user.emails, subject: "Lunch", mime_version: "1.0", content_type: "text/plain", body: ical.to_ical, content_disposition: "attachment; filename='calendar.ics'")
    return email
  end

  def send_next_lunch_email(user)
    @user = user
    email = mail(to: @user.email, subject: "Do you want to join the next qiao lunch?")
    return email
  end

  def send_signup_email(user)
    @user = user
    email = mail(to: @user.email, subject: "Welcome to qiao!")
    return email
  end

end
