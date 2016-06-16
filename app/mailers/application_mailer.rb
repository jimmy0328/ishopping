class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.action_mailer[:default][:from]
  layout 'mailer'
  include Roadie::Rails::Automatic
end
