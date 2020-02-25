class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    
    jobs = doc.css("article.job-post-wide .holder")
    
    jobs.each do |job|  #iterating over each posting
    #binding.pry
    
    #job objects below
    title = job.css("div.top-meta h4 a").text.strip
    location = job.css("div.location").text.strip
    post_date = job.css("span.time").text.strip
    about = job.css("div.text").text.strip
    profile = job.css("div.top-meta h4 a").attr("href").value 
    url = "https://www.coolworks.com#{profile}"
    #binding.pry
     #sending objects to Jobs class to be stored.
     WorkampJobs::Jobs.new(title, location, post_date, about, url)
    end
  end
end