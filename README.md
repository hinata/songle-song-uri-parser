# Songle Song URI Parser

## What is a Song URI?

A [Song URI](//songle.jp/songs/staff.aist.go.jp%2Ft.nakano%2Fmusic%2FVocaWatcher.Prologue.Miku.mp3) is an unique song ID that is managed by the [Songle](//songle.jp).

This gem package can parse it.

## Usage

### Prerequirements

- ruby >= 2.3

### Installation

```sh
$ gem install songle-song-uri-parser
```

### Example

```ruby
require "songle-song-uri-parser"

song =
  ::Songle::SongURI.parse("https://staff.aist.go.jp/t.nakano/music/VocaWatcher.Prologue.Miku.mp3")

p song.permalink #=> "https://staff.aist.go.jp/t.nakano/music/VocaWatcher.Prologue.Miku.mp3"
p song.type      #=> "mp3"
p song.to_s      #=> "https://songle.jp/songs/staff.aist.go.jp%2Ft.nakano%2Fmusic%2FVocaWatcher.Prologue.Miku.mp3"
```

## Development

### Prerequirements

- ruby >= 2.3

Install dependenting gem packages using bundler.

```sh
$ bundle install
```

### Running test

```sh
$ rake spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hinata/songle-song-uri-parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
