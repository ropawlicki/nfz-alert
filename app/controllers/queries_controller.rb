# frozen_string_literal: true

# query controller
class QueriesController < ApplicationController
  before_action :require_authentication

  def index
    @queries = current_user
               .queries
               .includes(:results)
               .includes(:user_queries).where(user_queries: { user_id: current_user.id })
               .order('user_queries.created_at desc')
               .each(&:decode_province!)
  end

  def show
    @query = Query.find_by!(hash_id: params[:hash_id]).decode_province!
    @user_query = current_user.user_queries.find_by(query_id: @query.id)
  end

  def new; end

  def create
    params = query_params
    if params.values.any?(&:empty?)
      flash[:warning] = 'Oba pola muszą być wypełnione'
      redirect_to queries_new_path and return
    end
    query = CreateQuery.call(params, current_user.id)
    redirect_to query_path(hash_id: query.hash_id)
  end

  def destroy
    current_user.user_queries.find_by(query_id: params[:id]).destroy
    redirect_to queries_path
  end

  private

  def query_params
    params.permit(:case, :province, :locality, :benefit)
  end
end
