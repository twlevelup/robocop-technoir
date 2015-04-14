require './lib/robocop.rb'

robo = Robocop.new

puts "\n\n\n"
puts "Hi, I'm a moving robot, I still don't have a name, but here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\tmove forward: will move me forwards*"
puts "\t\tmove backward: will move me backwards*"
puts "\t\tturn right: will rotate me right*"
puts "\t\tturn left: will rotate me left*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
puts "Please ender the commend you would me to carry out: "

while true
    userInput = gets.strip
    case userInput[0]
    when 'move forward'
        robo.forward
        puts "I just moved one block forwards"
    when 'move backward'
        puts "I just moved one block backwards"
    when 'turn right'
        puts "I just rotated to my right"
    when 'turn left'
        puts "I just rotated to my left"
    else
        puts "I do not understand that command"
    end

    # puts "Current lcoation is: [#{robo.x}, #{robo.y}]"
    puts "\nWhats my next command?: "
end