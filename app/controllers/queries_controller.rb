class QueriesController < ApplicationController

  def index
    @user_queries = current_user.queries
  end

  def result_display
    query = Query.find(params[:id])
    @query_results = query.results
  end

  def new
  end

  def create
    permitted_params = query_params
    permitted_params.each_value { |p| p.capitalize! }
    query = Query.find_or_create_by(permitted_params)
    query.user_queries.find_or_create_by(user_id: current_user.id)
  end

  def destroy
  end

  private

    def query_params
      params.permit(:case, :province, :locality, :benefit)
    end
end
