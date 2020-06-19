class FilterMailingQueries

  def self.call(user_id)
    user = User.find(user_id)
    queries = user.queries.map { |q| q if q.user_queries.find_by(user_id: user.id).created_at < user.last_sent_at }.compact
    queries = queries.each do |q|
      q.decode_province!
      q.results = q.results.map { |r| r unless r.mailing_ready_at.nil? || r.mailing_ready_at < user.last_sent_at }.compact
    end
    queries = queries.map { |q| q unless q.results.empty? }.compact
  end

end