# Artoo Adaptor For ARDrone

This repository contains the Artoo (http://artoo.io/) adaptor for the ARDrone 2.0 quadcopter (http://ardrone2.parrot.com/).

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

The artoo-ardrone adaptor is based on the hybridgroup fork of the argus gem (https://github.com/hybridgroup/argus).

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-ardrone.png)](https://codeclimate.com/github/hybridgroup/artoo-ardrone) [![Build Status](https://travis-ci.org/hybridgroup/artoo-ardrone.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-ardrone)

## Installing

```
gem install artoo-ardrone
```

## Using

```ruby
require 'artoo'

connection :ardrone, :adaptor => :ardrone, :port => '192.168.0.43:5556'
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  drone.start
  drone.take_off
  
  after(25.seconds) { drone.hover.land }
  after(30.seconds) { drone.stop }
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
