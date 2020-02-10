class WorkampJobs::Cli

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
  
  def more_info
    input = gets.strip.to_i
    if input.between?(1,WorkampJobs::Jobs.all.length)
      job = WorkampJobs::Jobs.all[input - 1]
      display_job_details(job) if valid_input(input, @jobs)
    end
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0 
  end
  
  def display_job_details(job)
    puts "--------------------------------------------------"
    puts "#{job.title}"
    puts "#{job.about}"
    puts "\nlocation for job selected is #{job.location}.\n"
    puts "\nThe job was posted on #{job.post_date}.\n"
    puts "--------------------------------------------------"
  end
  
  def next_step
    puts "Hit any key to see the list again or type 'exit' to exit."
    @input = gets.strip.downcase
  end
  
  def goodbye
    puts "Thank you and come back soon to see new job listings"
  end
end