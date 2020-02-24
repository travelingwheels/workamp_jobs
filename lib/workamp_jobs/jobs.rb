class WorkampJobs::Jobs
  
  attr_accessor :title, :location, :post_date, :about
  @@all = []
  
  def initialize(title, location, post_date, about)
    @title = title
    @location = location
    @post_date = post_date
    @about = about
    save
    #binding.pry
  end
  
  def self.all  #method to check if class variable is empty, if so then scrape. Also read from @@all array.
    WorkampJobs::Scraper.scrape_jobs if @@all.empty?
    @@all
  end
  
  def save  #method saves job objects to class variable @@all.
    @@all << self
  end
end