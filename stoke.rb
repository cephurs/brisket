#!/usr/bin/env ruby
$LOAD_PATH << './lib'
require 'directories'
require 'messages'
require 'naming'
require 'options'
require 'bnodes'
require 'socket'

commands = []
ARGV.each {|arg| commands << arg}
port = 22

i=0

if ARGV[0] == 'git'
puts Messages.update_git
while i < Bnodes.brisket_nodes.count
	puts Messages.ssh_to_bnode+Bnodes.brisket_nodes[i]
	puts Messages.git_pull
	system("ssh scanner@'#{Bnodes.brisket_nodes[i]}' \"sh -c 'cd /home/scanner/brisket && git pull'\"")
	i+=1
end
elsif ARGV[0] == 'status'
	while i < Bnodes.brisket_nodes.count
		s = TCPSocket.open(Bnodes.brisket_nodes[i], port)	
		puts "[+] "+Bnodes.brisket_nodes[i]+" is up..."
		puts "[-->] "+s.gets
		i+=1
	end
	s.close
end