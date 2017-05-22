# Array for testing
$students = [
  {name: "Dr Hannibal Lecter", age: 50, cohort: :november},
  {name: "Darth Vader", age: 50, cohort: :november},
  {name: "Nurse Ratched", age: 50, cohort: :november},
  {name: "Michael Corleone", age: 50, cohort: :november},
  {name: "Alex DeLarge", age: 50, cohort: :november},
  {name: "The Wicked Witch of the West", age: 50, cohort: :november},
  {name: "Terminator", age: 50, cohort: :november},
  {name: "Freddy Krueger", age: 50, cohort: :november},
  {name: "The Joker", age: 50, cohort: :november},
  {name: "Joffrey Baratheon", age: 50, cohort: :november},
  {name: "Norman Bates", age: 50, cohort: :november}
]

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice"
  students = [] # create an empty array
  name = gets.chomp # get the first name

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp # get another name from the user
  end
  students # return the array of students
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "--------------".center(80)
end

def list_students(students)
  # students.each_with_index do |student, index|
  #   puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  # end
  counter = 0

  until counter == students.length
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end

def select_students(students)
  puts "1. Search by characters in student's name"
  puts "2. Search by length of student's name"
  user_input = gets.chomp

  if user_input == "1"
    puts "Enter letters or words to search by: "
    search_letter = gets.chomp

    r = students.select { |student| student[:name] =~ /#{search_letter}/ }
    return r.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
  else
    r = students.select { |student| student[:name].length < 12 }
    r.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def main_menu
  puts "Villains Academy Student Directory".center(80)
  puts "----------------------------------\n".center(80)

  puts "MAIN MENU"
  puts "---------"
  puts "1. View full student directory"
  puts "2. Add a new student"
  puts "3. Search for a student"
  puts "4. Exit\n"

  while true
    print "Enter a number from the menu above: "
    user_input = gets.chomp.to_i

    case user_input
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
