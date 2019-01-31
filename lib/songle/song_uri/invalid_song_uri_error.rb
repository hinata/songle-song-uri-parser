# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class InvalidSongURIError < ::StandardError
    ##
    # @constructor
    #
    def initialize query_string
      super("'#{ query_string }' isn't song uri.")
    end
  end
end
