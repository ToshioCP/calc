#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby

require 'readline'
require_relative 'lib_calc.rb'

calc = Calc.new
if ARGV[0] =~ /--help|-h/
  $stderr.print "Usage: calc [expression]\n"
elsif ARGV.size == 1
  calc.run(ARGV[0])
else
  while buf = Readline.readline("calc > ", false)
    break if buf == "quit" || buf == "exit"
    calc.run(buf)
  end
end