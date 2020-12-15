# frozen_string_literal: true

# query controller
class QueriesController < ApplicationController
  before_action :require_authentication
  before_action :form_filling_check, only: :create

  def index
    @queries = current_user
               .queries
               .includes(:results)
               .includes(:user_queries).where(user_queries: { user_id: current_user.id })
               .order('user_queries.created_at desc')
               .each(&:decode_province!)
  end

  def create
    query = CreateQuery.call(query_params, current_user.id)
    redirect_to query_path(hash_id: query.hash_id)
  end

  def new; end

  def show
    @query = Query.find_by!(hash_id: params[:hash_id]).decode_province!
    @user_query = current_user.user_queries.find_by!(query_id: @query.id)
  end

  private

  def query_params
    params.permit(:case, :province, :locality, :benefit)
  end

  def form_filling_check
    if query_params.values.any?(&:empty?)
      flash[:warning] = 'Wszystkie pola muszą być wypełnione'
      redirect_to new_query_path
    end
  end
end
