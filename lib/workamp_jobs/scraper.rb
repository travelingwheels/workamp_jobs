class WorkampJobs::Scraper
  
  def self.scrape_jobs
    doc = Nokogiri::HTML(open("https://www.coolworks.com/jobs-with-rv-spaces"))
    #WorkampJobs::Jobs.new#(title, location, post_date)
    jobs = self.new
    jobs.title = title.css("div.text").text
    #jobs.location = doc.css("div.location").text
    #jobs.post_date = doc.css("div.bt-box").text.strip
  end
end
 ##option 3 - The Clean Model Method
      ##using the writer/setter method from the scraper

        # game_object = Game.new
        # home_and_team = game.css("div.game-info").text.split
        # game_object.team = home_and_team[1]
        # game_object.home = home_and_team[0]
        # game_object.date =  game.css("div.game-date").text
        # game_object.score = game.css("div.score").text
        # game_object.result = game.css("div.game-result").text
   # end