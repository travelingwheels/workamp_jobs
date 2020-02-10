class WorkampJobs::Cli

  def call
    puts "\nWelcome to Workamp jobs!\n"
    @input = ""
    until @input == "exit"
     get_jobs
     job_list
     more_info
     next_step
     #menu
    end
    goodbye
  end
  
  def get_jobs
    #binding.pry
    @jobs = WorkampJobs::Jobs.all
  end
  
  def job_list
    puts "\nHere is today's list of workamp jobs.\n"
    @jobs.each.with_index(1) do |job, idx|
      puts "#{idx}. #{job.title}"
      #binding.pry
    end
    puts "please choose a number to see more info."
    #more_info
  end

  #def menu
    #input = nil 
    #while input != "exit"
   # #binding.pry
     # puts "\nChoose a number to see more info about the job.\n"
      ##more_info
      #input = gets.strip.downcase
      #case input
      #when "list"
        #job_list
      #when "exit"
       # goodbye
      #else
        #puts "Sorry, that's not a valid input please type list to see list of jobs or exit."
      #end
      #more_info
    #end
  #end
  
  def more_info
    input = gets.strip.to_i
    if input.between?(1,WorkampJobs::Jobs.all.length)
      job = WorkampJobs::Jobs.all[input - 1]
      display_job_details(job)
    end
  end
  
  def display_job_details(job)
    puts "\nlocation for job selected is #{job.location}.\n"
    puts "\nThe job was posted on #{job.post_date}.\n"
  end
  
  def next_step
    puts "To choose another posting type list or type exit"
    @input = gets.strip.downcase
  end
  
  def goodbye
    puts "Thank you and come back soon to see new job listings"
  end
end