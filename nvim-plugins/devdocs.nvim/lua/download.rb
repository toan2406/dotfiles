#!/usr/bin/env ruby

# puts 'Hello World'
file = File.open('/Users/toannguyen/Downloads/hello3', 'w')
sleep(10)
file.puts('Hello!')
file.close
