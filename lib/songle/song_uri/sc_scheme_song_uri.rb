#@# vim: set filetype=ruby:
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
    URI_REGEXP = /^sc:\/\/(.+)$/

    ##
    # @constructor
    #
    def initialize query_string, options
      super(options)

      @source_host = SOURCE_HOST
      @source_path = SOURCE_PATH
      @source_id   = $1 if query_string =~ URI_REGEXP

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
