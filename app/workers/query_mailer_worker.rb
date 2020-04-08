class QueryMailerWorker
  include Sidekiq::Worker

  def perform
    users = User.all
    users.each do |u|
      UserMailer.update_query_email(u.id).deliver_later
    end
  end
  
end