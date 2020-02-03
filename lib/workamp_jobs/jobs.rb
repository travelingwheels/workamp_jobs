class WorkampJobs::Jobs
  
  attr_accessor :title, :location, :post_date
  @@all = []
  
  def initialize(title)
    @title = title
    @location = location
    @post_date = post_date
    save
  end
  
  def save
    @@all << self
  end
end