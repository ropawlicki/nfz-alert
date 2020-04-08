class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_query_email.subject
  #
  def update_query_email(user_id)
    user = User.find(user_id)
    @queries = user.queries
    mail to: "#{user.email}" if user.queries.flat_map(&:results).detect { |r| r.fresh? }
  end
end
