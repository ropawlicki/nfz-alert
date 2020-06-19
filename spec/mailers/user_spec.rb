require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  context "update_query_email" do

    before(:each) do
      @user = create(:user)
      @query = create(:query)
      @user.queries << @query
      @mail_last_sent = @user.last_sent_at
      @user.user_queries.first.update(created_at: @mail_last_sent - 2.hours)
    end
     
    context "results" do

      before(:each) do
        @fresh_result = create(:result, mailing_ready_at: @mail_last_sent + 1.hour)
        @query.results << @fresh_result 
        @overdue_result = create(:result, mailing_ready_at: @mail_last_sent - 1.hour)
        @query.results << @overdue_result
        @results = FilterMailingQueries.call(@user.id).flat_map(&:results)
      end

      it "newer than previous mailing are included" do
        expect(@results).to include @fresh_result
      end

      it "older than previous mailing are excluded" do
        expect(@results).not_to include @overdue_result
      end
    end
  end
end
