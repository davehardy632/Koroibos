class MedalCountFacade

  def initialize(country)
    @country = country
  end

  def return_medal_data
    response_obj = {}
    response_obj["country"] = country
    response_obj["medals"] = {}
    response_obj["medals"]["gold"] = total_gold_medals
    response_obj["medals"]["silver"] = total_silver_medals
    response_obj["medals"]["bronze"] = total_bronze_medals
    response_obj["total_medal_count"] = total_medal_count
    response_obj
  end

  def total_medal_count
    Olympian.total_medals(country)
  end

  def total_gold_medals
    olympians = []
    OlympianEvent.gold_medal_recipients.each do |olympian|
      olympians << olympian.olympian_id
    end
    gold_medal_count = 0
    olympians.each do |id|
      if Olympian.match_countries(id, country)
        gold_medal_count +=1
      end
    end
    gold_medal_count
  end

  def total_silver_medals
    olympians = []
    OlympianEvent.silver_medal_recipients.each do |olympian|
      olympians << olympian.olympian_id
    end
    silver_medal_count = 0
    olympians.each do |id|
      if Olympian.match_countries(id, country)
        silver_medal_count +=1
      end
    end
    silver_medal_count
  end

  def total_bronze_medals
    olympians = []
    OlympianEvent.bronze_medal_recipients.each do |olympian|
      olympians << olympian.olympian_id
    end
    bronze_medal_count = 0
    olympians.each do |id|
      if Olympian.match_countries(id, country)
        bronze_medal_count +=1
      end
    end
    bronze_medal_count
  end

  private

  attr_reader :country
end
