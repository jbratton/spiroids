require 'gosu'
require 'spiroids/version'
require 'spiroids/spiroid'
require 'spiroids/game'

module Spiroids
  def self.init
    begin
      Spiroids::Game.new.begin!
    rescue => e
      puts "oh geez something bad happened: #{e}\n#{e.backtrace.join("\n")}"
    end
  end
end
