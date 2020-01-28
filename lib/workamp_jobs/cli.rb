class WorkampJobs::Cli

  def call
    job_list
    menu
  end
  
  def job_list
    puts "Welcome to Workamp jobs!"
    puts "Here is today's list of workamp jobs."
    puts "Equestrian Trail guide - Mount Carmel, UT - seasonal."
    puts "Cooks, Servers, and Hosts - Mount Carmel, UT - seasonal."
  end

  def menu
    input = nil 
    while input != "exit"
      puts "Choose a number to see more info about the job."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on job 1 ..."
      when "2"
        puts "More info on job 2 ..."
      when "list"
        job_list
      when "exit"
        goodbye
      else
        puts "Not a valid input please type list to see list of jobs or exit."
      end
    end
  end
  
  def goodbye
    puts "Thank you and come back soon to see new job listings"
  end
end