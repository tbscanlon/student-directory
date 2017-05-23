# Array for testing
$students = [
  {name: "Dr Hannibal Lecter", age: "50", cohort: :november},
  {name: "Darth Vader", age: "50", cohort: :november},
  {name: "Nurse Ratched", age: "50", cohort: :november},
  {name: "Michael Corleone", age: "50", cohort: :june},
  {name: "Alex DeLarge", age: "50", cohort: :june},
  {name: "The Wicked Witch of the West", age: "50", cohort: :june},
  {name: "Terminator", age: "50", cohort: :april},
  {name: "Freddy Krueger", age: "50", cohort: :april},
  {name: "The Joker", age: "50", cohort: :july},
  {name: "Joffrey Baratheon", age: "50", cohort: :july},
  {name: "Norman Bates", age: "50", cohort: :november}
]

def input_students
  puts "Please enter the details of the students."
  puts "To finish, just enter a blank value"
  students = [] # create an empty array
  # puts "Enter the new student's name: "
  name = " " # get the first name

  while !name.empty? do
    puts "Enter the new student's name: "
    name = gets # get the first name
    name.delete!! "\n"
    break if name.empty?

    puts "Enter the new student's age: "
    age = gets
    age.delete!! "\n"
    break if age.empty?

    puts "Enter the new student's cohort: "
    cohort = gets
    cohort.delete! "\n"
    break if cohort.empty?

    # Verify input
    puts "Student name: #{name}"
    puts "Student age: #{age}"
    puts "Student cohort: #{cohort}"
    puts "Is this correct? (y/n)"
    user_input = gets
    user_input.delete! "\n"
    next if user_input.downcase == "n"

    students << {name: name, age: age, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # name = gets.chomp # get another name from the user
  end
  students # return the array of students
end

def print_header(header)
  puts header.center(80)
  puts ("-" * header.length).center(80)
end

def list_students(students)
  # students.each_with_index do |student, index|
  #   puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  # end
  # counter = 0
  #
  # until counter == students.length
  #   puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
  #   counter += 1
  # end

  april_students = $students.select {|student| student if student[:cohort] == :april }
  june_students = $students.select {|student| student if student[:cohort] == :june }
  july_students = $students.select {|student| student if student[:cohort] == :july }
  november_students = $students.select {|student| student if student[:cohort] == :november }

  print_header("April Cohort")
  april_students.each_with_index {|student, index| puts "#{index+1}. #{student[:name]}"}

  print_header("June Cohort")
  june_students.each_with_index {|student, index| puts "#{index+1}. #{student[:name]}"}

  print_header("July Cohort")
  july_students.each_with_index {|student, index| puts "#{index+1}. #{student[:name]}"}

  print_header("November Cohort")
  november_students.each_with_index {|student, index| puts "#{index+1}. #{student[:name]}"}

  print_footer(students)
end

def select_students(students)
  puts "1. Search by characters in student's name"
  puts "2. Search by length of student's name"
  user_input = gets
  user_input.delete! "\n"

  if user_input == "1"
    puts "Enter letters or words to search by: "
    search_letter = gets
    user_input.delete! "\n"

    r = students.select { |student| student[:name] =~ /#{search_letter}/ }
    return r.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
  else
    r = students.select { |student| student[:name].length < 12 }
    r.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
  end
end

def print_footer(students)
  puts students.length == 1 ? "Overall, we have #{students.count} great student" : "Overall, we have #{students.count} great students"
end

def main_menu
  print_header("Villains Academy Student Directory")

  puts "MAIN MENU"
  puts "---------"
  puts "1. View full student directory"
  puts "2. Add a new student"
  puts "3. Search for a student"
  puts "4. Exit\n"

  while true
    print "Enter a number from the menu above: "
    user_input = gets
    user_input.delete!! "\n"

    case user_input.to_i
    when 1 then list_students($students)
    when 2 then input_students
    when 3 then select_students($students)
    when 4 then exit
    else puts "Please enter a valid number."
    end
  end
end

# students = input_students
# print_header
# print(students)
# print_footer(students)
# select_students(students)

main_menu
