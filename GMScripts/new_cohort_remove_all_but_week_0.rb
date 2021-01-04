def remove_all_but_week_zero_from(cohort_id)
  course_to_keep = "Week 0: Fundamentals & Setting Up Your Development Environment"
  Cohort.find(cohort_id).courses.where.not(name: course_to_keep).delete_all
end
