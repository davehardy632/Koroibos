class OlympiansSerializer
  include FastJsonapi::ObjectSerializer

  def self.all_olympians
    Olympian.return_olympians
  end

end
