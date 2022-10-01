#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby

require 'fileutils'
include FileUtils

def usage
  $stderr.print "Usage: ruby install.rb [+|-]\n"
  $stderr.print "       +: install (default)\n"
  $stderr.print "       -: uninstall\n"
end

def install
  cp "calc.rb", "#{@path}/calc"
  cp "lib_calc.rb", "#{@path}/lib_calc.rb"
  chmod 0755, "#{@path}/calc"
end

def uninstall
  rm_f "#{@path}/calc"
  rm_f "#{@path}/lib_calc.rb"
end

@path = "#{Dir.home}/bin" # target directory
case ARGV[0]
when '+', nil then install
when '-' then uninstall
when '?', '-h', '--help' then usage
end
