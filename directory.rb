require 'csv'

@students = [] # an ampty array accessible to all methods
@filename = ""

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    insert_students_to_array(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def insert_students_to_array(name, cohort="november")
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts @students.count == 1 ? "Overall, we have #{@students.count} great student" : "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to #{@filename}"
  puts "4. Load the list from #{@filename}"
  puts "5. Set the file where student data should be accessed"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def change_filename
  puts "Enter a new file for saving and loading student data"
  @filename = STDIN.gets.chomp
  puts "Working file has been changed to #{@filename}"
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "5" then change_filename
  when "9" then exit
  else puts "I don't know what you mean, try again"
  end
end

def save_students
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "Saved #{@students.count} students to #{@filename}"
end

def load_students
  CSV.foreach(@filename) do |line|
    name, cohort = line
    insert_students_to_array(name, cohort)
  end
  puts "Loaded #{@students.count} students."
end

def try_load_students
  @filename = ARGV.first.nil? ? "students.csv" : ARGV.first
  File.exists?(@filename) ? load_students : (puts "#{@filename} not found - skipping loading.")
end

try_load_students
interactive_menu
