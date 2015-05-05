require './lib/robocop.rb'
require './lib/grid.rb'

# This will clear the screen, so that it's easier to use
system("clear")

robots = [Robocop.new(5, 0), Robocop.new(4, 2)]

grid = Grid.new

puts "\n\n\n"
puts "Hi, I'm a robot moving system, here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\t******Navigation******"
puts "\t\t# f: will move me forwards*"
puts "\t\t# b: will move me backwards*"
puts "\t\t# r: will rotate me right*"
puts "\t\t# l: will rotate me left*"
puts "\n\t\twhere # is the robot id you would like to control\n"
puts "\n"
puts "\t\t******Admin******"
puts "\t\tlist: will list all robot ids, locations, directions"
# puts "\t\tgo to [x, y]: will move me from my current location to a new location*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
# puts "I am currently at #{grid.getStreet(robo.x, robo.y)}, facing #{robo.direction}"
puts "Please enter the command you would like me to carry out: "



while true

    userInput = gets.strip

    case userInput
    when /[1-9]+\s*f/
        selectedId = userInput.scan( /[1-9]+/).first.to_i - 1

        if selectedId < robots.length
            selectedRobot = robots[selectedId]
            selectedRobot.forward
            puts "I am currently at #{grid.getStreet(selectedRobot.x, selectedRobot.y)}, facing #{selectedRobot.direction}"
        else
            puts "Robot does not exist, please try again!"
        end
        
    when 'b'
        robo.backward
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}, facing #{robo.direction}"
    when 'r'
        robo.rotateRight
        puts "I just rotated to my right"
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}, facing #{robo.direction}"
    when 'l'
        robo.rotateLeft
        puts "I just rotated to my left"
        puts "I am currently at #{grid.getStreet(robo.x, robo.y)}, facing #{robo.direction}"
    when 'list'
        puts "\n"
        puts "id\t\tlocation\t\t\tdirection"
        count = 0
        robots.each { |r|
            puts "#{count + 1}\t\t#{grid.getStreet(r.x, r.y)}\t#{r.direction}"
            count += 1
        }

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
