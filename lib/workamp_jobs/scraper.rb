class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    jobs = doc.css("")
    WorkampJobs::jobs.new
    binding.pry
  end
end