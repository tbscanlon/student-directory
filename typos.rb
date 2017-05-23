def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = [] # create an empty array
  name = gets.chomp # get the first name

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}

    puts "Now we have #{students.count} students"
    name = gets.chomp # get another name from the user
  end
  students # return the array of students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
