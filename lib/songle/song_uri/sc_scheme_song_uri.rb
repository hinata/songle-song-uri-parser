# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class ScSchemeSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = ::Songle::SongURI::ScSongURI::SOURCE_HOST

    ##
    # @constant
    #
    SOURCE_PATH = ::Songle::SongURI::ScSongURI::SOURCE_PATH

    ##
    # @constant
    #
    TYPE = ::Songle::SongURI::ScSongURI::TYPE

    ##
    # @constant
    #
    URI_REGEX = /^sc:\/\/(.+)$/

    ##
    # @constructor
    #
    def initialize string, options
      super(string, options)

      @source_host = SOURCE_HOST
      @source_path = SOURCE_PATH
      @source_id   = $1 if string =~ URI_REGEX

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(string)
      end

      @source_path += @source_id
    end

    ##
    # @function
    #
    def type
      return TYPE
    end
  end
end
