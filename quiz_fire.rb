require 'firebase'
require 'json'

base_uri = 'https://quiz-application.firebaseio.com/'

firebase = Firebase::Client.new(base_uri)

response=firebase.get("eng-quiz")
c=response.body
puts c.class
  c.each do |key, value|
  # puts key
  value.each do |k,v|
    puts k
    puts v
  end
end

  # k.each do |x|
  #   puts x['question']
  #   x['options'].each do |i, j|
  #     puts "#{i}: #{j}"
  #   end
  #   ans = gets.chomp.downcase
  #   if ans == x['answer']
  #     count += 1
  #   end
  # end
  # end_time = Time.now
  # diff = (end_time - begin_time)
  # a = Time.at(diff).utc.strftime('%H:%M:%S')
  # puts "You got #{count} questions out of 10"
  # puts "Time spent: #{a}"
