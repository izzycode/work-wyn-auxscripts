def update_positions(cohort_id)

  title_with_position = {
                          "Use The Correct OS":                               0,
                          "Install The Chrome Browser":                       1,
                          "Install Your Text Editor":                         2,
                          "Create A GitHub Account":                          3,
                          "Create A Heroku Account":                          4,
                          "Install XCode":                                    5,
                          "Install Homebrew":                                 6,
                          "Install The Latest Git":                           7,
                          "Install The Latest Node Package Manager (NPM)":    8,
                          "Installing Yarn":                                  9,
                          "Verify Your Setup (front-end)":                    10,
                        }

  pre_work_tasks = Cohort.find(cohort_id).units.find_by(name: "Setting Up Your Development Environment").tasks

  pre_work_tasks.each do |task|
    orig_task = Task.find(task.id)
    orig_task.update(position: title_with_position[task.title.to_sym])
    puts "Task: #{orig_task.title} | Position: #{orig_task.position}"
  end

  pre_work_tasks.pluck(:title, :position)
end
