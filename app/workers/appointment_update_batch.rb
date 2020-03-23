class AppointmentUpdateBatch
  include Sidekiq::Worker

  def perform
    b = Sidekiq::Batch.new
    b.on(:success, AppointmentUpdateBatch)
    b.jobs { AppointmentUpdateWorker.perform_async }
  end

  def on_success(status, options)
    ResultCleanerWorker.perform_async
  end
end