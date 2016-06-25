require 'curses'

module Ultima
  module Core
    class Logger
      MESSAGE_LIMIT = 20

      LEVEL = {
        info: Curses::COLOR_YELLOW,
        fatal: Curses::COLOR_RED
      }

      def self.instance
        @@instance ||= new
      end

      def self.log(*args)
        instance.log(*args)
      end

      def self.update
        instance.update
      end

      def update
        y = 0
        x = 0
        Curses.clear
        @messages.each do |msg|
          Curses.setpos(y, x)
          Curses.attron(Curses.color_pair(LEVEL[msg[:level]]) | Curses::A_NORMAL) do
            Curses.addstr("#{msg[:last_occured_at]}ms: #{msg[:message]}")
          end
          y += 1
        end
        Curses.refresh
      end

      def log(message, level = :info)
        # TODO: Output log content to stdout upon exit.
        if original = @messages.select { |h| h[:message] == message }.first
          original[:last_occured_at] = Gosu::milliseconds
        else
          @messages << {
            message: message,
            level: level,
            last_occured_at: Gosu::milliseconds
          }
        end
        @messages.sort_by! { |v| v[:last_occured_at] }
      end

      private

      def initialize
        @messages = []

        Curses.init_screen
        Curses.stdscr.keypad(true)
        Curses.start_color

        LEVEL.values.each do |color|
          Curses.init_pair(color, color, Curses::COLOR_BLACK)
        end

        begin
          Curses.crmode
        ensure
          Curses.close_screen
        end
      end
    end
  end
end
