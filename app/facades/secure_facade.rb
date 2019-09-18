class SecureFacade

  def initialize(country)
    @country = country
  end

  def valid_country?
    if Olympian.find_by(team: country)
      true
    end
  end

  private

  attr_reader :country

end
