class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    
    jobs = doc.css("div.container")
    
    jobs.each do |job|
    
    title = doc.css("div.text").css("div.top-meta h4 a").map(&:text)
    location = doc.css("div.location").map(&:text)
    post_date = doc.css("section.job-post-row").css("div.wrap").map(&:text)
    
     WorkampJobs::Jobs.new(title, location, post_date)
    end
  end
end

#WorkampJobs::Jobs.new#(title, location, post_date)
#jobs = self.new
    #binding.pry