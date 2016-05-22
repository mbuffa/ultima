require 'json'

module Ultima
  module Core
    class Singer
      SONGS = {
        intro: 'data/songs/no_more_magic.ogg'
      }.freeze

      def initialize
        @songs = {}
        @current = nil

        # TODO: Move this to an external class.
        file = File.read('data/settings.json')
        settings = JSON.parse(file)
        @mute = settings.dig('singer', 'mute')

        SONGS.each do |key, value|
          begin
            @songs[key] = Gosu::Song.new(value)
          rescue RuntimeError
            # TODO: Log something.
          end
        end
      end

      def play(song_symbol)
        # TODO: Error check.
        @current.stop if @current.is_a?(Gosu::Song)
        return if @mute
        @current = @songs[song_symbol]
        @current.play(true)
      end

      def stop
        @current.stop if @current.is_a?(Gosu::Song)
      end
    end
  end
end
