require './lib/robocop.rb'
require './lib/grid.rb'

# This will clear the screen, so that it's easier to use
system("clear")

robo = Robocop.new(5, 0)

grid = Grid.new

puts "\n\n\n"
puts "Hi, I'm a moving robot, here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\t******Navigation******"
puts "\t\tf: will move me forwards*"
puts "\t\tb: will move me backwards*"
puts "\t\tr: will rotate me right*"
puts "\t\tl: will rotate me left*"
puts "\n\n"
puts "\t\tgo to [x, y]: will move me from my current location to a new location*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
puts "I am currently at #{grid.getStreet(robo.x, robo.y)} facing #{robo.direction}"
puts "Please enter the command you would like me to carry out: "



while true

    userInput = gets.strip

    case userInput
    when 'f'
        robo.forward
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}"
        puts "I am currently facing #{robo.direction}"
    when 'b'
        robo.backward
        puts "I just moved one block backwards"
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}"
        puts "I am currently facing #{robo.direction}"
    when 'r'
        robo.rotateRight
        puts "I just rotated to my right"
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}"
        puts "I am currently facing #{robo.direction}"
    when 'l'
        robo.rotateLeft
        puts "I just rotated to my left"
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}"
        puts "I am currently facing #{robo.direction}"

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
