# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class YtSchemeSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = ::Songle::SongURI::YtSongURI::SOURCE_HOST

    ##
    # @constant
    #
    SOURCE_PATH = ::Songle::SongURI::YtSongURI::SOURCE_PATH

    ##
    # @constant
    #
    TYPE = ::Songle::SongURI::YtSongURI::TYPE

    ##
    # @constant
    #
    URI_REGEX = /^yt:\/\/(.+)$/

    ##
    # @constructor
    #
    def initialize query, options
      super(query, options)

      @source_host = SOURCE_HOST
      @source_path = SOURCE_PATH
      @source_id   = $1 if query =~ URI_REGEX

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(query)
      end

      @source_path += @source_id
    end

    ##
    # @method
    #
    def type
      return TYPE
    end
  end
end
