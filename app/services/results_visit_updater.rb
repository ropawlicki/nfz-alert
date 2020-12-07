# frozen_string_literal: true

class ResultsVisitUpdater
  def self.call(id)
    User.find(id).update_attribute(:visited_results_at, Time.zone.now)
  end
end
