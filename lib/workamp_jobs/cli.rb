class WorkampJobs::Cli

  def call
     puts "\nWelcome to Workamp jobs!\n"
     get_jobs
     job_list
     menu
  end
  
  def get_jobs
    #binding.pry
    @jobs = WorkampJobs::Jobs.all
  end
  
  def job_list
    puts "\nHere is today's list of workamp jobs.\n"
    @jobs.each.with_index(1) do |job, idx|
      puts "#{idx}. #{job.title}, #{job.location}, #{job.post_date}"
      #binding.pry
    end
  end

  def menu
    input = nil 
    while input != "exit"
    #binding.pry
      puts "Choose a number to see more info about the job."
      input = gets.strip.downcase
      if input.to_i.between?(1,WorkampJobs::Jobs.all.size)
      #case input
      #when "1"
        #puts "More info on job 1 ..."
      #when "2"
        #puts "More info on job 2 ..."
      #when "list"
        #job_list
      #when "exit"
        #goodbye
      #else
        #puts "Sorry, that's not a valid input please type list to see list of jobs or exit."
      #end
      end
    end
  end
  
  def goodbye
    puts "Thank you and come back soon to see new job listings"
  end
end