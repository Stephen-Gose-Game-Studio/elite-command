class OneShotKill < Achievement
  @queue = :high

  triggered_on :attack
  has_tiers 1, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000, 12500, 15000, 100000

  class << self
    def display_name
      'One Shot, One Kill'
    end

    def description
      'Kill a rival unit in a single attack.'
    end

    def enqueue_check!(payload)
      Resque.enqueue(self, payload[:command].to_json_hash)
    end

    def grant?(command)
      command = command.with_indifferent_access
      info = command[:ivars]

      if info[:defender_starting_health] == 10 and info[:attacker_damage] >= 10
        user = User.find(command[:user_id])
        return grant_return(user.achieved!(self), user)
      else
        return grant_return(false)
      end
    end
  end
end
