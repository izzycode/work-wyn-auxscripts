def update_positions(cohort_id)

  title_with_position = {
                          "Use The Correct OS":           0,
                          "Install The Chrome Browser":   1,
                          "Create A GitHub Account":      2,
                          "Create A Heroku Account":      3,
                          "Install Your Text Editor":     4,
                          "Install XCode":                5,
                          "Install Homebrew":             6,
                          "Install The Latest Ruby":      7,
                          "Install PostgreSQL":           8,
                          "Install The Latest Git":       9,
                          "Install Rails":                10,
                          "Install RSpec":                11,
                          "Install Node and Yarn":        12,
                          "Create .railsrc file":         13,
                          "Verify Your Setup":            14,
                          "Let's get organized":          15,
                        }

  pre_work_tasks = Cohort.find(cohort_id).units.find_by(name: "Setting Up Your Development Environment").tasks

  pre_work_tasks.each do |task|
    orig_task = Task.find(task.id)
    orig_task.update(position: title_with_position[task.title.to_sym])
    puts "Task: #{orig_task.title} | Position: #{orig_task.position}"
  end

  pre_work_tasks.pluck(:title, :position)
end
