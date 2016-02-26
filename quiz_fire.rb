require 'firebase'
require 'json'

base_uri = 'https://quiz-application.firebaseio.com/'

firebase = Firebase::Client.new(base_uri)

response=firebase.get("eng-quiz")
c=response.body
 a=c["-KBO92cLKNsH_uq9DhdI"]
 ar = []
  a.each do |key, value|
   # puts key
   # puts value
 #   ar << value
 # end

 # puts ar
 # ar.each
 #  ar.each do |items|
 #    puts items['question']
 #    items['options'].each do |key, value|
 #      puts "#{key}: #{value}"
 #    end
 #    answer = gets.chomp.downcase
 #    if answer == items['answer']
 #      count += 1
 #    end
 #  end
 #  end_time = Time.now
 #  time_diff = (end_time - begin_time)
 #  time_spent = Time.at(time_diff).utc.strftime('%H:%M:%S')
 #  puts "\nYou got #{count} questions out of 10"
 #  puts "Time spent: #{time_spent}"