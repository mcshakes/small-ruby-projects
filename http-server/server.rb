require "socket"
require "uri"

WEB_ROOT = "./public"

CONTENT_TYPE_MAPPING = {
  "html" => "text/html",
  "txt"  => "text/plain",
  "png" => "image/png",
  "jpg" => "image/jpeg"
}

DEFAULT_CONTENT_TYPE = "application/octet-stream"

def content_type(path)
  ext = File.extname(path).split(".").last
  CONTENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
end

def requested_file(request_line)

end

server = TCPServer.new("localhost", 2345)

loop do
  socket = server.accept
  request = socket.gets

  STDERR.puts request_line

  response = "We're Live!\n"

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"

  socket.print response

  socket.close
end
