class WorkampJobs::Jobs
  
  attr_accessor :title, :location, :post_date
  @@all = []
  
  def initialize(title, location, post_date)
    @title = title
    @location = location
    @post_date = post_date
    save
    binding.pry
  end
  
  def self.all
    WorkampJobs::Scraper.scrape_jobs if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
end