class WorkampJobs::Jobs
  
  attr_accessor :title, :location, :post_date, :about, :url
  @@all = []
  
  def initialize(title, location, post_date, about, url)
    @title = title
    @location = location
    @post_date = post_date
    @about = about
    @url = url
    save
    #binding.pry
  end
  
  def self.all
    WorkampJobs::Scraper.scrape_jobs if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
end