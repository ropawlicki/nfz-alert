class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_query_email.subject
  #
  def update_query_email(user_id)
    user = User.find(user_id)
    queries = user.queries.map { |q| q if q.user_queries.find_by(user_id: user.id).created_at < user.last_sent_at }.compact
    queries = queries.each do |q|
      q.decode_province!
      q.results = q.results.map { |r| r unless r.mailing_ready_at.nil? || r.mailing_ready_at < user.last_sent_at }.compact
    end
    @queries = queries.map { |q| q unless q.results.empty? }.compact
    unless @queries.empty?
      mail to: "#{user.email}"
      user.update_attribute(:last_sent_at, Time.zone.now)
    end
 

    #user = User.find(user_id)
    #valid_queries = user.queries.map { |q| q if q.user_queries.find_by(user_id: user.id).created_at < user.last_sent_at }.compact
    #valid_queries_ids = valid_queries.map(&:id)
    #results = valid_queries.flat_map { |q| q.results }
    #valid_results = results.map { |r| r unless r.mailing_ready_at.nil? || r.mailing_ready_at < user.last_sent_at }.compact
    #unless valid_queries.empty? || valid_results.empty?
      #@query_results = valid_results.group_by { |r| r.queries.where(id: valid_queries_ids).first }
      #mail to: "#{user.email}"
      #user.update_attribute(:last_sent_at, Time.zone.now)
    #end

  end
end
