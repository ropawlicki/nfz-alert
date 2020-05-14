class ActiveResetWorker
  include Sidekiq::Worker

  def perform
    Result.update_all(active: false)
  end
end