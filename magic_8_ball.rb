#user inputs question

class Eight_ball
	def initialize 
		@DEFAULT_ANSWERS = [           	
				"It is certain",
				"It is decidedly so",
				"Without a doubt",
				"Yes, definitely",
				"You may rely on it",
				"As I see it, yes",
				"Most likely",
  			"Outlook good",
  			"Yes",
  			"Signs point to yes",
  			"Reply hazy try again",
  			"Ask again later",
  			"Better not tell you now",
  			"Cannot predict now",
  			"Concentrate and ask again",
  			"Don't count on it",
  			"My reply is no",
  			"My sources say no",
  			"Outlook not so good",
  			"Very doubtful",
  		]
		@answers = []
		@answers.push(*@DEFAULT_ANSWERS)
		

		if ARGV[0] == "add_answers"
			add_answers.times {write_answer}
		end


	end

	def ask
    puts "What is your question?"
    question = STDIN.gets.strip
	end

	# computer outputs a goodbye message and exits
	# User can input QUIT
	def exit_now
		puts "Goodbye!"
	end

	# computer outputs a random answer
	def response
		puts @answers[rand(@answers.length - 1)]
	end

	def reset_answers
		@answers.clear
		@answers.push(*@DEFAULT_ANSWERS)
	end

	def add_answers
		while true
			puts "How many answers do you want to add to the magic 8 ball?"
			num = STDIN.gets.strip
      if /\d+/.match(num) 
			 	return /\d+/.match(num)[0].to_i
			puts "Please enter a number"
		  end
		end
	end
	
	def write_answer
		while true
			puts "Write the answer you want to add to the 8 ball:"
			new_answer = STDIN.gets.strip
			if !@answers.include?(new_answer)
					@answers.push(new_answer)
					puts "Added the new answer."
					return
			end
			puts "That answer already exists"
		end
	end

	def print_answers
		@answers.each {|a| puts a}
  end
	
	def feedback
		puts "I am the magic 8 ball"
		while true
			user_input = ask
			case user_input
			when "QUIT"
				exit_now
				return
			when "print_answers"
				print_answers
			when "add_answers"
				add_answers.times {write_answer}
      when "reset_answers"
        reset_answers
			else 
				response
			end
		end
	end
end

magic = Eight_ball.new

magic.feedback	
