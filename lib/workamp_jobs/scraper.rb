class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    
    jobs = doc.css("div.content-holder")
    
    jobs.each do |job|
    
    title = job.css("div.top-meta h4 a").map(&:text)
    location = job.css("div.location").map(&:text)
    post_date = job.css("span.time").map(&:text)
    #binding.pry
     WorkampJobs::Jobs.new(title, location, post_date)
    end
  end
end