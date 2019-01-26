# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class NumericSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    TYPE = "numeric"

    ##
    # @constant
    #
    URI_REGEX = /^(|\/\/[\w.]+\/[\w.]+\/|http(|s):\/\/[\w.]+\/[\w.]+\/)(\d+)$/

    ##
    # @constructor
    #
    def initialize query, options
      super(query, options)

      @source_host = nil
      @source_path = nil
      @source_id   = $3 if query =~ URI_REGEX
    end

    ##
    # @method
    #
    def type
      return TYPE
    end

    ##
    # @method
    #
    def to_s
      return "#{ self.endpoint }#{ @source_id }"
    end
  end
end
