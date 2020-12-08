# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_authentication
    redirect_to unauthenticated_root_path if current_user.nil?
  end
end
