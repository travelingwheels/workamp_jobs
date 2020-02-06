class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    
    section = doc.css("div.container")
    
    jobs = section.css("section.job-post-row")
    
    jobs.each do |job|
    
    title = job.css("div.top-meta h4 a").text
    location = job.css("div.location").text
    post_date = job.css("section.job-post-row").css("div.wrap").text
    
     WorkampJobs::Jobs.new(title, location, post_date)
    end
  end
end

#WorkampJobs::Jobs.new#(title, location, post_date)
#jobs = self.new
    #binding.pry