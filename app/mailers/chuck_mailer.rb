class ChuckMailer < ApplicationMailer
  def send_joke(email, chuck)
    @chuck = chuck
    mail(to: email, subject: I18n.t('an_amazing_chuck_joke'))
  end
end
