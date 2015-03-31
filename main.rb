require './lib/robocop.rb'

robo = Robocop.new

puts "\n\n\n"
puts "Hi, I'm a moving robot, I still dont have a name, but here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\tu: will move me up*"
puts "\t\td: will move me down*"
puts "\t\tr: will rotate me right*"
puts "\t\tl: will rotate me left*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
puts "Please ender the commend you would me to carry out: "

while true
    userInput = gets.strip
    case userInput[0]
    when 'u'
        robo.forward
        puts "I just moved on block up"
    when 'd'
        robo.forward
        puts "I just moved on block down"
    when 'r'
        robo.forward
        puts "I just rotated to my right"
    when 'l'
        robo.forward
        puts "I just rotated to my left"
    else
        puts "I do not understand that command"
    end

    # puts "Current lcoation is: [#{robo.x}, #{robo.y}]"
    puts "\nWhats my next command?: "
end
