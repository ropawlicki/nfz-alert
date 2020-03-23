class ResultCleanerWorker
  include Sidekiq::Worker

  def perform
    today = Date.today
    Result.where("active = ? OR date < ?", false, today).destroy_all
  end

end