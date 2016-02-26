require 'firebase'
require 'json'

base_uri = 'https://quiz-application.firebaseio.com/'

firebase = Firebase::Client.new(base_uri)

response = firebase.get("eng-quiz")
c = response.body
quiz = []
c.each{|id,record|
  quiz << record
}
eng = quiz[0]['English']
count = 0;
correct = 0
failed = 0
while count < eng.length
  puts eng[count]['question']
  options = eng[count]['options']
  options.each{|key,value|
    puts "#{key}: #{value}"
  }
  choose = gets.chomp
  if choose == eng[count]['answer']
    puts "Correct!"
    correct += 1
  else
    puts "Wrong!"
    failed += 1
  end
  count += 1
end

  puts "You have #{correct} out of 10"