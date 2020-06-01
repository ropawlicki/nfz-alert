class QueriesController < ApplicationController

  def index
    @user_queries = current_user.queries.paginate(page: params[:page], per_page: 10)
    @user_queries.each { |q| q.decode_province! }
    #@user_queries = current_user.queries.includes(:province_code)
  end

  def result_display
    query = Query.find(params[:id])
    @query_results = query.results.order("date").paginate(page: params[:page], per_page: 10)
  end

  def new
  end

  def create
    permitted_params = query_params
    if params.values.any?(&:empty?)
      flash[:warning] = "Oba pola muszą być wypełnione"
      redirect_to queries_new_path and return
    end
    permitted_params.each_value { |p| p.capitalize! }
    query = Query.find_by(permitted_params)
    if query.nil?
      query = Query.create(permitted_params)
      InitialSearch.call(query.id)
      query.user_queries.create(user_id: current_user.id)
    end
    redirect_to query_path(id: query.id)
  end

  def destroy
    current_user.user_queries.find(params[:id]).destroy
    redirect_to queries_path
  end

  def update_results_visit
    user_query = UserQuery.find(params[:id])
    user_query.update_attribute(:visited_results_at, Time.zone.now)
  end

  private

    def query_params
      params.permit(:case, :province, :locality, :benefit)
    end

end
