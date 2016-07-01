# Ultima

[![Build Status](https://travis-ci.org/mbuffa/ultima.svg?branch=master)](https://travis-ci.org/mbuffa/ultima)

Ultima is a dungeon crawler prototype inspired by great games such as *Dungeon Master*, *Eye of the Beholder* and *Lands of Lore* (although it is very unlikely that it'll ever get superb and colorful graphics such as those of these two last ones) released back in the 80's and 90's, and whose goal consisted of exploring tiled maps (usually dark dungeons infested with monsters and traps) with a limited party of adventurers, using a fake 3D first person view and sprites.

The name 'Ultima' is a low reference to Lord British's first game, *Akalabeth: World of Doom*.

It's under development at a pretty early stage right now: I only work on it on my spare time, and I'm writing it in Ruby, which, at first, may seem odd or unreasonable. Yet I'm confident it'll allow me to experiment and perform reasonably well for my needs (ie. it should be ok for a game like this without targeting low-end computers).

## Installation

In a Linux or OS X console:

    $ git clone git@github.com:mbuffa/ultima.git

And then execute:

    $ bundle

Depending on your setup, you may also need to install some native libraries in order to build gosu and texplay. Please refer to their own installation guides:
* [Gosu wiki page](https://github.com/gosu/gosu/wiki)
* [Texplay github repo](https://github.com/banister/texplay)

## Usage

First, download assets by running:

```ruby
./bin/setup
```

And then run the game:

```ruby
./bin/game
```

And thank me for getting you blind!

You can edit one or two settings by editing `data/settings.json` and by figuring out which does what :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mbuffa/ultima.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

