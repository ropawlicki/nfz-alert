# frozen_string_literal: true

class ResultCleanerWorker
  include Sidekiq::Worker

  def perform
    today = Date.today
    Result.where('validated_at < ? OR date < ?', Time.zone.now.beginning_of_day - 1.day, today).destroy_all
  end
end
