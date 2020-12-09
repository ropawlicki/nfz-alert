# frozen_string_literal: true

# results controller
class ResultsController < ApplicationController
  before_action :require_authentication

  def index
    @query = Query.find(params[:id]).decode_province!
    @user_query = current_user.user_queries.find_by(query_id: params[:id])
    @results = @query.results.order('date')
  end
end