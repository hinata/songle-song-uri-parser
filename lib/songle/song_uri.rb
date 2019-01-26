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
    def initialize query, options = nil
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
      def parse query, options = nil
        query =
          ::URI.decode_www_form_component(query.to_s)

        case
        when query =~ ::Songle::SongURI::NnSongURI::URI_REGEX
          return ::Songle::SongURI::NnSongURI.new(query, options)
        when query =~ ::Songle::SongURI::NnSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::NnSchemeSongURI.new(query, options)
        when query =~ ::Songle::SongURI::NnShortSongURI::URI_REGEX
          return ::Songle::SongURI::NnShortSongURI.new(query, options)
        when query =~ ::Songle::SongURI::ScSongURI::URI_REGEX
          return ::Songle::SongURI::ScSongURI.new(query, options)
        when query =~ ::Songle::SongURI::ScSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::ScSchemeSongURI.new(query, options)
        when query =~ ::Songle::SongURI::YtSongURI::URI_REGEX
          return ::Songle::SongURI::YtSongURI.new(query, options)
        when query =~ ::Songle::SongURI::YtSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::YtSchemeSongURI.new(query, options)
        when query =~ ::Songle::SongURI::YtShortSongURI::URI_REGEX
          return ::Songle::SongURI::YtShortSongURI.new(query, options)
        when query =~ ::Songle::SongURI::NumericSongURI::URI_REGEX
          return ::Songle::SongURI::NumericSongURI.new(query, options)
        else
          return ::Songle::SongURI::Mp3SongURI.new(query, options)
        end
      end
    end
  end
end
