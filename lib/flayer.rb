#!/usr/bin/env ruby

require 'optparse'
require 'rubygems'
require 'sexp_processor'
require 'ruby_parser'
require 'timeout'
require 'digest/md5'
require 'phash/text'

mass_threshold = 100

source_file = '/Users/mah/Dropbox/Dev/flay/lib/flay.rb'

sexp = RubyParser.new.process(File.binread(source_file), source_file)
    
    sexp.deep_each do |node|
      next unless node.any? { |sub| Sexp === sub }
      next if node.mass < mass_threshold

      puts "NODE DETAIL"
      puts node.to_s
      puts "NODE MASS"
      puts node.mass
      puts ""
      puts "NODE HASH"
      puts Digest::MD5.digest(node.to_s)
      puts ""

    end

