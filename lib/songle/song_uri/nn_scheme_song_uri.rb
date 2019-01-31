# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class NnSchemeSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = ::Songle::SongURI::NnSongURI::SOURCE_HOST

    ##
    # @constant
    #
    SOURCE_PATH = ::Songle::SongURI::NnSongURI::SOURCE_PATH

    ##
    # @constant
    #
    TYPE = ::Songle::SongURI::NnSongURI::TYPE

    ##
    # @constant
    #
    URI_REGEX = /^nn:\/\/(.+)$/

    ##
    # @constructor
    #
    def initialize query_string, options
      super(options)

      @source_host = SOURCE_HOST
      @source_path = SOURCE_PATH
      @source_id   = $1 if query_string =~ URI_REGEX

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(query_string)
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
