class WorkampJobs::Cli
  
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"

  def call
    puts "\nWelcome to Workamp jobs!\n"
    @input = ""
    until @input == "exit"
     get_jobs
     job_list
     more_info
     next_step
    end
    goodbye
  end
  
  def get_jobs  #method to get job objects from the Jobs class.
    #binding.pry
    @jobs = WorkampJobs::Jobs.all
  end
  
  def job_list  #method iterate through job objects and display the title and number each one.
    puts "\nHere is today's list of workamp jobs.\n"
    @jobs.each.with_index(1) do |job, idx|
      puts "#{idx}. #{job.title}"
      #binding.pry
    end
    puts "please choose a number to see more info."
  end
  
  def more_info  #method to get users input and also checks for valid input.
    input = gets.strip.to_i
    if input.between?(1,WorkampJobs::Jobs.all.length)
      job = WorkampJobs::Jobs.all[input - 1]
      display_job_details(job) if valid_input(input, @jobs)
    end
  end
  
  def valid_input(input, data)  #this method is connected to more_info to check user input.
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def display_job_details(job)  #display method.
    puts "--------------------------------------------------------------------------------"
    puts "#{@@grn}#{job.title}#{@@white}"
    puts "#{job.about}"
    puts "\nlocation for job selected: #{@@cyn}#{job.location}.#{@@white}\n"
    puts "\nThe job was posted on #{@@blu}#{job.post_date}.#{@@white}\n"
    puts "--------------------------------------------------------------------------------"
  end
  
  def next_step
    puts "Hit any key and enter to see the list or type 'exit' to exit."
    @input = gets.strip.downcase
  end
  
  def goodbye
    puts "Thank you and come back soon to see new job listings"
  end
end