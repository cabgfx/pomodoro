#!/usr/bin/env ruby

require 'thor'
require 'time'

class PomodoroCLI < Thor
  desc "pomo", "Calculate the number of Pomodoros within a given time range"

  option :start, aliases: '-s', type: :string, desc: "Start time (HH:mm)"
  option :end, aliases: '-e', type: :string, desc: "End time (HH:mm)"
  option :now, aliases: '-n', type: :numeric, desc: "Start from now and count N hours forward"
  option :duration, aliases: '-d', type: :numeric, default: 20, desc: "Pomodoro duration in minutes"
  option :break, aliases: '-b', type: :numeric, default: 5, desc: "Short break duration in minutes"
  option :longbreak, aliases: '-l', type: :numeric, default: 15, desc: "Long break duration in minutes"

  def pomo
    # Determine start and end times
    if options[:now]
      start_time = Time.now
      end_time = start_time + (options[:now] * 3600) # Convert hours to seconds
    elsif options[:start] && options[:end]
      start_time = Time.parse(options[:start])
      end_time = Time.parse(options[:end])

      # Handle the case where the end time is on the next day
      end_time += 86400 if end_time < start_time # Add 24 hours in seconds
    else
      puts "Error: You must provide either -n (--now) or both -s (--start) and -e (--end)."
      exit(1)
    end

    # Calculate the total available time in minutes
    total_minutes = ((end_time - start_time) / 60).to_i

    # Extract parameters
    pomo_duration = options[:duration]
    break_duration = options[:break]
    longbreak_duration = options[:longbreak]

    # Calculate time per cycle (3 Pomodoros + breaks)
    cycle_time = (3 * pomo_duration) + (2 * break_duration) + longbreak_duration

    # Calculate number of full cycles and remaining time
    full_cycles = total_minutes / cycle_time
    remaining_minutes = total_minutes % cycle_time

    # Calculate additional Pomodoros that can fit in the remaining time
    additional_pomos = remaining_minutes / (pomo_duration + break_duration)

    # Calculate total Pomodoros
    total_pomodoros = (full_cycles * 3) + additional_pomos

    # Output results
    puts "Total time available: #{total_minutes} minutes"
    puts "Cycle details: 3 pomodoros per cycle, #{longbreak_duration}-minute long break"
    puts "Calculation based on start time: #{start_time.strftime('%H:%M')} and end time: #{end_time.strftime('%H:%M')}"
    puts "Result: You can fit #{total_pomodoros} pomodoros into your available time from #{start_time.strftime('%H:%M')} to #{end_time.strftime('%H:%M')}."
  end
end

PomodoroCLI.start(ARGV)
