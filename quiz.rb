require 'rubygems'
require 'json'
require 'pp' 
data = File.read('src/quiz_questions.json')
$questions = JSON.parse(data)

def list_quizzes
  puts "Welcome! what quiz do you want to take?"
  puts "Enter 'G' for General questions\nEnter 'C' for Computer Technolgy questions"
  reply=gets.chomp.upcase!
  reply
end

def take_quiz
  if list_quizzes=='G'
    count=0
    a=$questions["General"]
    a.each do |x|
      puts x['question']
      x['options'].each do |i,j|
        puts "#{i}: #{j}"
      end
       ans = gets.chomp.downcase
       if ans==x["answer"]
        puts "correct"
        count+=1
        else
          puts "wrong"
      end
    end
    puts "You got #{count} questions out of 10"
  elsif list_quizzes=='C'
    count=0
    a=$questions["Computer Technology"]
    a.each do |x|
      puts x['question']
      x['options'].each do |i,j|
        puts "#{i}: #{j}"
      end
      ans = gets.chomp.downcase
      if ans==x["answer"]
        puts "correct"
        count+=1
       else
          puts "wrong"
      end
    end
  puts "You got #{count} questions out of 10"
  else 
     puts "Please enter either 'G' or 'C'"
     take_quiz
  end
end

take_quiz


