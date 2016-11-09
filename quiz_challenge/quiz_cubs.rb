def quiz(file)
# input = File.read(file)
input = File.open(file)

topic = ""
result = ""
questions = []
choices = []
correct_answers = []

score = 0
choice = 0

input.each do |row|
  topic = /(?<=topic: ).*/.match(row) if /(?<=topic: ).*/.match(row)

  questions << /.+(?<=[?]).*/.match(row).to_s if /.+(?<=[?]).*/.match(row)

  choices << /.+(?<=[.]).*/.match(row).to_s if /.+(?<=[.]).*/.match(row)

  correct_answers << /(?<=Correct: ).*/.match(row).to_s if /(?<=Correct: ).*/.match(row)
end

puts "Welcome To The Quiz!\n+++++++++++++++++++\n\nThis quiz will be about #{topic}.\n\n..........................\n\n"

questions.each do |question|
  place = questions.index(question)
  puts "#{question}\n#{choices[choice]}\n#{choices[choice + 1]}\n#{choices[choice + 2]}"
  choice += 3
  answer = gets.chomp
  if answer == correct_answers[place]
    puts "You are right!\n\n..........................\n\n"
    score += 1
  else
    puts "Sorry, you are wrong, the correct answer was #{correct_answers[place]}.\n\n..........................\n\n"
  end

end
puts "Thanks for playing! You got #{score} out of #{questions.length} questions correct!"
end

quiz("quiz_source_text.txt")
quiz("risa.txt")