class Revenue
  attr_reader :id,
              :revenue 

  def initialize(revenue)
    @revenue = revenue
    id = nil
  end
end
