class UpdateStartBatch
  include Sidekiq::Worker

  def perform
    b = Sidekiq::Batch.new
    b.on(:complete, UpdateStartBatch)
    b.jobs { ActiveResetWorker.perform_async }
  end

  def on_complete(status, options)
    AppointmentUpdateBatch.perform_async
  end
end