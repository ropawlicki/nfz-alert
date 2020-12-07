# frozen_string_literal: true

desc 'This task is called by the Heroku scheduler add-on'
task appointment_update: :environment do
  AppointmentUpdateBatch.perform_async
end

task send_updates: :environment do
  QueryMailerWorker.perform_async
end
