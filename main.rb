require './lib/robocop.rb'

# This will clear the screen, so that it's easier to use
system("clear")

robo = Robocop.new

puts "\n\n\n"
puts "Hi, I'm a moving robot, I still don't have a name, but here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\t******Navigation******"
puts "\t\tmove forward: will move me forwards*"
puts "\t\tmove backward: will move me backwards*"
puts "\t\tturn right: will rotate me right*"
puts "\t\tturn left: will rotate me left*"
puts "\n\n"
puts "\t\tgo to [x, y]: will move me from my current location to a new location*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
puts "Please ender the commend you would me to carry out: "



while true

    userInput = gets.strip

    case userInput
    when 'move forward'
        robo.forward
        puts "I just moved one block forwards"
        puts "I am currently at #{robo.location}"
    when 'move backward'
        robo.backword
        puts "I just moved one block backwards"
        puts "I am currently at #{robo.location}"
    when 'turn right'
        robo.rotateRight
        puts "I just rotated to my right"
        puts "I am currently at #{robo.location}"
    when 'turn left'
        robo.rotateLeft
        puts "I just rotated to my left"
        puts "I am currently at #{robo.location}"

    when /go to \[[1-9]+\s*,\s*[1-9]+\]/
        robo.rotateLeft
        x = userInput.scan( /[1-9]+/).first
        y = userInput.scan( /[1-9]+/).last

        puts "I will not move to [#{x}, #{y}]"

        path = robo.moveTo(x.to_i, y.to_i)

        puts "This is the path I took: \n"
        path.count.times { |i|
            puts path[i]
            sleep(0.5)
        }
    else
        puts "I do not understand that command"
    end

    # puts "Current lcoation is: [#{robo.x}, #{robo.y}]"
    puts "\n\nWhats my next command?: "
end
