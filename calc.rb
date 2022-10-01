#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby

require 'readline'
require_relative 'lib_calc.rb'

calc = Calc.new
while buf = Readline.readline("calc > ", false)
  break if buf == "quit" || buf == "exit"
  calc.run(buf)
end
