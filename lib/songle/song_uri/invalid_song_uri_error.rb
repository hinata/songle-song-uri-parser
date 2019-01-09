# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class InvalidSongURIError < ::StandardError
    ##
    # @constructor
    #
    def initialize string
      super("'#{ string }' isn't song uri.")
    end
  end
end
