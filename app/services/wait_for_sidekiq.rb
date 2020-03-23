class WaitForSidekiq

  def self.call
    sleep 1 until Sidekiq::Queue.new.size == 0 && Sidekiq::Workers.new.size == 0
  end

end