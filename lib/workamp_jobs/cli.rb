class WorkampJobs::Cli

  def call
    puts "Welcome to Workamp jobs!"
    job_list
  end
  
  def job_list
    puts "Here is today's list of workamp jobs."
    puts "Equestrian Trail guide - Mount Carmel, UT - seasonal."
    puts "Cooks, Servers, and Hosts - Mount Carmel, UT - seasonal."
  end
end