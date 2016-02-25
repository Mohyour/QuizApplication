require 'rubygems'
require 'json'
require 'pp'
require 'date'
data = File.read('src/quiz_questions.json')
$questions = JSON.parse(data)

def list_quizzes
  puts 'Welcome! what quiz do you want to take?'
  puts 'I have General quiz and Computer quiz in my library'
end
list_quizzes

def take_quiz(name)
  count = 0
  begin_time = Time.now
  a = $questions[name]
  a.each do |x|
    puts x['question']
    x['options'].each do |i, j|
      puts "#{i}: #{j}"
    end
    ans = gets.chomp.downcase
    if ans == x['answer']
      count += 1
    end
  end
  end_time = Time.now
  diff = (end_time - begin_time)
  a = Time.at(diff).utc.strftime('%H:%M:%S')
  puts "You got #{count} questions out of 10"
  puts "Time spent: #{a}"
end

def import_quiz(file)
  data = File.read(file)
  b = JSON.parse(data)
  count = 0
  begin_time = Time.now
  puts 'You have the following quizes:'
  b.each do |x, y|
    puts x
  end
  puts 'Enter quiz name'
  name = gets.chomp.capitalize
  a = b[name]
  a.each do |x|
    puts x['question']
    x['options'].each do |i, j|
      puts "#{i}: #{j}"
    end
    ans = gets.chomp.downcase
    if ans == x['answer']
      count += 1
    end
  end

  end_time = Time.now
  diff = (end_time - begin_time)
  a = Time.at(diff).utc.strftime('%H:%M:%S')
  puts "You got #{count} questions out of 10"
  puts "Time spent: #{a}"
end

loop do
  puts "Enter 'G' for General questions:"
  puts "Enter 'C' for Computer questions"
  puts "Enter 'M' to import your own quiz from a json file."
  puts "Enter 'Q' to exit"
  reply = gets.chomp.upcase

  if reply == 'G'
    take_quiz('General')

  elsif reply == 'C'
    take_quiz('Computer')

  elsif reply == 'M'
    puts 'Specify the path to your file'
    file = gets.chomp
    import_quiz(file)

  elsif reply == 'Q'
    system(exit)

  else
    puts 'Please enter the right input'
  end
end
