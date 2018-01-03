class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.reduce(0) do |sum, activity|
      sum + activity.total_cost
    end
  end

  def summarize_balance
    summary = {}
    @activities.each do |activity|
      activity.balance.each do |name, balance|
        if summary.has_key?(name)
          summary[name] += balance
        else
          summary[name] = balance
        end
      end
    end
    return summary
  end

  def print_summary
    puts summarize_balance
  end
end
