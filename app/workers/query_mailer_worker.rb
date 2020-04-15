class QueryMailerWorker
  include Sidekiq::Worker

  def perform
    User.find_each do |u|
      UserMailer.update_query_email(u.id).deliver_later if u.user_fresh_results.any?
    end
  end
  
end