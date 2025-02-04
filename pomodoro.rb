#!/usr/bin/env ruby

require 'thor'
require 'time'

class PomodoroCLI < Thor
  desc "pomo", "Calculate the number of Pomodoros within a given time range"

  option :start, aliases: '-s', type: :string, desc: "Start time (HH:mm, 24-hour clock). If not provided, the current time will be used."
  option :end, aliases: '-e', type: :string, desc: "End time (HH:mm, 24-hour clock). Required unless using -n option."
  option :now, aliases: '-n', type: :numeric, desc: "Start from now and count N hours forward"
  option :duration, aliases: '-d', type: :numeric, default: 20, desc: "Pomodoro duration in minutes (default: 20)"
  option :break, aliases: '-b', type: :numeric, default: 5, desc: "Short break duration in minutes (default: 5)"
  option :longbreak, aliases: '-l', type: :numeric, default: 15, desc: "Long break duration in minutes (default: 15)"
  option :cycles, aliases: '-c', type: :numeric, default: 4, desc: "Number of Pomodoros per cycle (default: 4)"

  def self.exit_on_failure?
    true
  end

  def pomo
    # Determine start and end times
    if options[:now]
      start_time = Time.now
      end_time = start_time + (options[:now] * 3600) # Convert hours to seconds
    elsif options[:end]
      start_time = Time.now
      end_time = Time.parse(options[:end])

      # Handle the case where the end time is on the next day
      end_time += 86400 if end_time < start_time # Add 24 hours in seconds
    else
      puts "Error: You must provide either -n (--now) or -e (--end)."
      exit(1)
    end

    # Calculate the total available time in minutes
    total_minutes = ((end_time - start_time) / 60).to_i

    # Extract parameters
    pomo_duration = options[:duration]
    break_duration = options[:break]
    longbreak_duration = options[:longbreak]
    pomos_per_cycle = options[:cycles]

    # Calculate time per cycle (N Pomodoros + breaks)
    cycle_time = (pomos_per_cycle * pomo_duration) + ((pomos_per_cycle - 1) * break_duration) + longbreak_duration

    # Calculate number of full cycles and remaining time
    full_cycles = total_minutes / cycle_time
    remaining_minutes = total_minutes % cycle_time

    # Calculate additional Pomodoros that can fit in the remaining time
    additional_pomos = remaining_minutes / (pomo_duration + break_duration)

    # Calculate total Pomodoros
    total_pomodoros = (full_cycles * pomos_per_cycle) + additional_pomos

    # Output results
    puts "Total time available: #{total_minutes} minutes"
    puts "Cycle details: #{pomos_per_cycle} pomodoros per cycle, #{longbreak_duration}-minute long break"
    puts "Calculation based on start time: #{start_time.strftime('%H:%M')} and end time: #{end_time.strftime('%H:%M')}"
    puts "Result: You can fit #{total_pomodoros} pomodoros into your available time from #{start_time.strftime('%H:%M')} to #{end_time.strftime('%H:%M')}."
  end
end

PomodoroCLI.start(ARGV)
