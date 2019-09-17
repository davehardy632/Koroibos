class StatsFacade

  def self.return_general_stats
    response_obj = {}
    response_obj["olympian_stats"] = {}
    response_obj["olympian_stats"]["total_competing_olympians"] = total_olympians
    response_obj["olympian_stats"]["average_weight"] = {}
    response_obj["olympian_stats"]["average_weight"]["unit"] = "kg"
    response_obj["olympian_stats"]["average_weight"]["male_olympians"] = average_male_weight
    response_obj["olympian_stats"]["average_weight"]["female_olympians"] = average_female_weight
    response_obj["olympian_stats"]["average_age"] = average_age
    response_obj
  end

  def self.total_olympians
    Olympian.count
  end

  def self.average_male_weight
    Olympian.average_male_weight
  end

  def self.average_female_weight
    Olympian.average_female_weight
  end

  def self.average_age
    Olympian.average_age
  end

end
