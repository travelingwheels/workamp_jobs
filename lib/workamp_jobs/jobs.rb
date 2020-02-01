class WorkampJobs::Jobs
  
  attr_accessor :title, :location, :post_date, :ref
  @@all = []
  
  def initialize(title)
    @title = title
    save
  end
  
  def save
    @@all << self
  end
end