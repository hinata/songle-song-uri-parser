# -*- coding: utf-8 -*-
require "json"

::RSpec.describe ::Songle::SongURI do
  it do
    song =
      ::Songle::SongURI.parse("http://example.com/song.mp3", {
        endpoint_scheme: "https",
        endpoint_host: "test.songle.jp",
        endpoint_path: "/extra/songs/"
      })

    expect(song.to_s).to eq("https://test.songle.jp/extra/songs/example.com%2Fsong.mp3")
  end

  ::Dir.glob("./spec/fixtures/*.json") do | json_file_path |
    test_cases =
      ::JSON.parse(::File.read(json_file_path))

    test_cases.each do | test_case |
      song =
        ::Songle::SongURI.parse(test_case[ "string" ])

      test_case[ "result" ].each do | method, result |
        it do
          expect(song.send(method)).to eq(result)
        end
      end
    end
  end
end
