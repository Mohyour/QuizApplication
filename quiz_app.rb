require 'rubygems'
require 'json'
require 'pp'
require 'colorize'
require 'date'
data = File.read('src/quiz_questions.json')
$questions = JSON.parse(data)

def list_quizzes
  puts "-------\nWelcome! what quiz do you want to take?".green
  puts "I have General quiz and Computer quiz in my library\n---------------".green
end
list_quizzes

def take_quiz(name)
  puts "\n---------------\nType in the right option\n-----------------"
  count = 0
  begin_time = Time.now
  quiz = $questions[name]
  quiz.each do |items|
    puts items['question']
    items['options'].each do |key, value|
      puts "#{key}: #{value}"
    end
    answer = gets.chomp.downcase
    if answer == items['answer']
      puts "Correct!"
      count += 1
    else
      puts "Wrong"
    end
  end
  end_time = Time.now
  time_diff = (end_time - begin_time)
  time_spent = Time.at(time_diff).utc.strftime('%H:%M:%S')
  puts "\nYou got #{count} questions out of 10"
  puts "Time spent: #{time_spent}"
end

def import_quiz(file_path)
  data = File.read(file_path)
  new_quiz = JSON.parse(data)
  puts "You have the following quizes:"
  new_quiz.each do |x, _y|
    puts x
  end
  puts "----\nEnter quiz name"
  name = gets.chomp.capitalize
  puts "\n---------------\nType in the right options\n---------------"
  count = 0
  begin_time = Time.now
  quiz = new_quiz[name]
  quiz.each do |item|
    puts item['question']
    item['options'].each do |key, value|
      puts "#{key}: #{value}"
    end
    answer = gets.chomp.downcase
    if answer == item['answer']
      puts "Correct!"
      count += 1
    else
      puts "Wrong"
    end
  end

  end_time = Time.now
  time_diff = (end_time - begin_time)
  time_spent = Time.at(time_diff).utc.strftime('%H:%M:%S')
  puts "\nYou got #{count} questions out of 10"
  puts "Time spent: #{time_spent}"
end

loop do
  puts "------\nEnter 'G' for General questions:".blue
  puts "Enter 'C' for Computer questions".blue
  puts "Enter 'M' to import your own quiz from a json file.".blue
  puts "Enter 'Q' to exit\n---------------".blue
  reply = gets.chomp.upcase

  if reply == 'G'
    take_quiz('General')

  elsif reply == 'C'
    take_quiz('Computer')

  elsif reply == 'M'
    puts "Specify the path to your file\n-----------------"
    file_path = gets.chomp
    import_quiz(file_path)

  elsif reply == 'Q'
    puts "Thank you! Have a nice day and keep learning."
    system(exit)

  else
    puts 'Please enter the correct input'.red
  end
end