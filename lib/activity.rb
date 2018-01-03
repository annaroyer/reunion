class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.reduce(0, :+)
  end

  def split
    total_cost / @participants.count
  end

  def balance
    balance = {}
    @participants.each do |name, amount_paid|
      balance[name] = split - amount_paid
    end
    return balance
  end
end
