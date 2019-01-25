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
    def initialize string, options = nil
      options ||= {}

      @endpoint_scheme =
        options[ :endpoint_scheme ] || ENDPOINT_SCHEME

      @endpoint_host =
        options[ :endpoint_host ] || ENDPOINT_HOST

      @endpoint_path =
        options[ :endpoint_path ] || ENDPOINT_PATH
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
      def parse string, options = nil
        string =
          ::URI.decode_www_form_component(string.to_s)

        case
        when string =~ ::Songle::SongURI::NnSongURI::URI_REGEX
          return ::Songle::SongURI::NnSongURI.new(string, options)
        when string =~ ::Songle::SongURI::NnSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::NnSchemeSongURI.new(string, options)
        when string =~ ::Songle::SongURI::NnShortSongURI::URI_REGEX
          return ::Songle::SongURI::NnShortSongURI.new(string, options)
        when string =~ ::Songle::SongURI::ScSongURI::URI_REGEX
          return ::Songle::SongURI::ScSongURI.new(string, options)
        when string =~ ::Songle::SongURI::ScSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::ScSchemeSongURI.new(string, options)
        when string =~ ::Songle::SongURI::YtSongURI::URI_REGEX
          return ::Songle::SongURI::YtSongURI.new(string, options)
        when string =~ ::Songle::SongURI::YtSchemeSongURI::URI_REGEX
          return ::Songle::SongURI::YtSchemeSongURI.new(string, options)
        when string =~ ::Songle::SongURI::YtShortSongURI::URI_REGEX
          return ::Songle::SongURI::YtShortSongURI.new(string, options)
        when string =~ ::Songle::SongURI::NumericSongURI::URI_REGEX
          return ::Songle::SongURI::NumericSongURI.new(string, options)
        else
          return ::Songle::SongURI::Mp3SongURI.new(string, options)
        end
      end
    end
  end
end
