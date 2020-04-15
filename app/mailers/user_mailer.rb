class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_query_email.subject
  #
  def update_query_email(user_id)
    user = User.find(user_id)
    user_queries_ids = user.queries.map(&:id)
    @query_results = user.user_fresh_results.map(&:result).group_by { |r| r.queries.where(id: user_queries_ids).first }
    mail to: "#{user.email}"
    user.user_fresh_results.destroy_all
  end
end
