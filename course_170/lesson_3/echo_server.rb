require 'socket'

server = TCPServer.new(8080)
puts "Server listening on http://localhost:8080"
`open http://localhost:8080`

def parse_params(path)
  return {} if (path =~ /\?/).nil?
  params_part = path.split(/\?/).last
  params_part = params_part.split('&').map do |param|
    param_arr = param.split('=')
    param_arr[0] = param_arr[0].to_sym
    param_arr
  end.to_h
end

loop do
  client = server.accept
  request = client.gets
  next unless request

  method, path, http = request.split
  params = parse_params(path)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts %q(<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><meta http-equiv="X-UA-Compatible" content="ie=edge"><title>TCPServer</title></head><body><pre>)

  number = params[:number].to_i

  client.puts "<h1>Counter</h1>"
  client.puts "<p>The current number is #{number}.</p>"

  client.puts %Q(<a href="?number=#{number - 1}">Subtract One</a>)
  client.puts %Q(<a href="?number=#{number + 1}">Add One</a>)

  client.puts %q(</pre></body></html>)
  client.close
end
