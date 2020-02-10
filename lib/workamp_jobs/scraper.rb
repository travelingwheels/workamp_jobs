class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    
    jobs = doc.css("article.job-post-wide .holder")
    
    jobs.each do |job|
    
    title = job.css("div.top-meta h4 a").text.strip
    location = job.css("div.location").text.strip
    post_date = job.css("span.time").text.strip
    #binding.pry
     WorkampJobs::Jobs.new(title, location, post_date)
    end
  end
end