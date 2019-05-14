require 'socket'
require_relative 'notes'

server = TCPServer.new '192.168.50.207', 8888

socket = server.accept

they_said = 0
notes = Notes.new

loop do
  socket.puts "1. Create a note"
  socket.puts "2. View notes"
  socket.puts "3. Quit"
  they_said = socket.gets.to_i
  case
    when they_said == 1
      socket.puts "What is your note?"
      new_note = socket.gets.chomp
      notes.create_note(new_note)
    when they_said == 2
      socket.puts notes.view_notes
    when they_said == 3
      break
  end
end

socket.close






# socket.puts "What do you say?"
# they_said = socket.gets.chomp
# until they_said == "quit"
#   socket.puts "You said: #{they_said}. Goodbye!"
#   socket.puts "What do you say?"
#   they_said = socket.gets.chomp
# end
