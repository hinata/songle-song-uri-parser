#@# vim: set filetype=ruby:
require "json"

::RSpec.describe ::Songle::SongURI do
  [
    { endpoint_scheme: nil, endpoint_host: nil, endpoint_path: nil },
    { endpoint_scheme: "", endpoint_host: "", endpoint_path: "" },
    { endpoint_scheme: " ", endpoint_host: " ", endpoint_path: " " }
  ].each do | testcase |
    it do
      song_uri =
        ::Songle::SongURI.parse("http://example.com/song.mp3", {
          endpoint_scheme: testcase[ :endpoint_scheme ],
          endpoint_host: testcase[ :endpoint_host ],
          endpoint_path: testcase[ :endpoint_path ]
        })

      expect(song_uri.to_s).to eq("#{ ::Songle::SongURI::ENDPOINT_SCHEME }://#{ ::Songle::SongURI::ENDPOINT_HOST }#{ ::Songle::SongURI::ENDPOINT_PATH }example.com%2Fsong.mp3")
    end
  end

  [
    { endpoint_scheme: "https", endpoint_host: "test.songle.jp", endpoint_path: "/extra/songs/" },
    { endpoint_scheme: " https", endpoint_host: " test.songle.jp", endpoint_path: " /extra/songs/" },
    { endpoint_scheme: "https ", endpoint_host: "test.songle.jp ", endpoint_path: "/extra/songs/ " },
  ].each do | testcase |
    it do
      song_uri =
        ::Songle::SongURI.parse("http://example.com/song.mp3", {
          endpoint_scheme: testcase[ :endpoint_scheme ],
          endpoint_host: testcase[ :endpoint_host ],
          endpoint_path: testcase[ :endpoint_path ]
        })

      expect(song_uri.to_s).to eq("https://test.songle.jp/extra/songs/example.com%2Fsong.mp3")
    end
  end

  ::Dir.glob("./spec/fixtures/*.json") do | json_file_path |
    test_cases =
      ::JSON.parse(::File.read(json_file_path))

    test_cases.each do | test_case |
      song_uri =
        ::Songle::SongURI.parse(test_case[ "query_string" ])

      test_case[ "result" ].each do | method, result |
        it do
          expect(song_uri.send(method)).to eq(result)
        end
      end
    end
  end
end
