# -*- coding: utf-8 -*-
module ::Songle
  module SongURI
    attr_reader :endpoint_scheme
    attr_reader :endpoint_host
    attr_reader :endpoint_path
    attr_reader :source_host
    attr_reader :source_path
    attr_reader :source_id

    ##
    # @constant
    #
    ENDPOINT_SCHEME = "https"

    ##
    # @constant
    #
    ENDPOINT_HOST = "songle.jp"

    ##
    # @constant
    #
    ENDPOINT_PATH = "/songs/"

    ##
    # @constructor
    #
    def initialize options = nil
      options ||= {}

      @endpoint_scheme =
        (options[ :endpoint_scheme ] || "").strip != "" ? options[ :endpoint_scheme ].strip : ENDPOINT_SCHEME

      @endpoint_host =
        (options[ :endpoint_host ] || "").strip != "" ? options[ :endpoint_host ].strip : ENDPOINT_HOST

      @endpoint_path =
        (options[ :endpoint_path ] || "").strip != "" ? options[ :endpoint_path ].strip : ENDPOINT_PATH
    end

    ##
    # @method
    #
    def endpoint
      return "#{ self.endpoint_scheme }://#{ self.endpoint_host }#{ self.endpoint_path }"
    end

    ##
    # @method
    #
    def permalink
      return "http://#{ self.source_host }#{ self.source_path }"
    end

    ##
    # @method
    #
    def type
      return nil
    end

    ##
    # @method
    #
    def to_s
      encoded_source_host =
        ::URI.encode_www_form_component(self.source_host)

      encoded_source_path =
        ::URI.encode_www_form_component(self.source_path)

      return "#{ self.endpoint }#{ encoded_source_host }#{ encoded_source_path }"
    end

    class << self
      ##
      # @method
      # @static
      #
      def parse query_string, options = nil
        query_string =
          ::URI.decode_www_form_component(query_string.to_s)

        case
        when query_string =~ ::Songle::SongURI::NnSongURI::URI_REGEX
          return ::Songle::SongURI::NnSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::NnSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::NnSchemeSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::NnShortSongURI::URI_REGEX
          return ::Songle::SongURI::NnShortSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::ScSongURI::URI_REGEX
          return ::Songle::SongURI::ScSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::ScSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::ScSchemeSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::YtSongURI::URI_REGEX
          return ::Songle::SongURI::YtSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::YtSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::YtSchemeSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::YtShortSongURI::URI_REGEX
          return ::Songle::SongURI::YtShortSongURI.new(query_string, options)
        when query_string =~ ::Songle::SongURI::NumericSongURI::URI_REGEX
          return ::Songle::SongURI::NumericSongURI.new(query_string, options)
        else
          return ::Songle::SongURI::Mp3SongURI.new(query_string, options)
        end
      end
    end
  end
end
