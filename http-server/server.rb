require "socket"

server = TCPServer.new("localhost", 2345)

loop do
  socket = server.accept

  STDERR.puts request

  response = "We're Live!\n"

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
end