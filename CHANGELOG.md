# CHANGELOG.md

## v1.1.7 (2020-03-02 JST)
- Merged https://github.com/hinata/songle-song-uri-parser/pull/1

## v1.1.6 (2019-07-27 JST)
- Resolved it issue, when included the whitespace in the URI (e.g. "https://he3.magnatune.com/all/05-Goodbye%20Perfectionist-Linda%20Woods.mp3")

## v1.1.5 (2019-07-19 JST)
- Deleted unused gems

## v1.1.4 (2019-07-08 JST)
- Fixed minor bugs
- Supported the private song URI (e.g. "https://songle.jp/uploads/{ID}.mp3")

## v1.1.3 (2019-02-06 JST)
- Updated README.md

## v1.1.2 (2019-01-31 JST)
- Changed constractor parameters in a `::Songle::SongURI` class
- Improved about loading modules

## v1.1.1 (2019-01-26 JST)
- Improved validation in constractor parameters

## v1.1.0 (2019-01-25 JST)
- Changed return value of a `Songle::SongURI#type` method (e.g. from "yt" to "youtube")
- Supported to the numeric URI (e.g. "https://songle.jp/songs/{ID}")

## v1.0.0 (2019-01-09 JST)
- Initial public release
