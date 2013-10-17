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

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  on drone, :ready => :fly
  drone.start
end

def fly(*data)
  drone.take_off
  after(15.seconds) { drone.hover.land }
  after(20.seconds) { drone.stop }
end
```

## Connecting to ARDrone

The ARDrone is a WiFi device, so there is no additional work to establish a connection to a single drone. However, in order to connect to multiple drones, you need to perform some configuration steps on each drone via SSH.

## Automatic Reset From Emergency Mode

When you first connect to the ARDrone by calling the `start` method, if it is in "emergency" mode, the ARDrone will not take off. Artoo can automatically reset it back "normal" mode, to be able to fly IF you pass in the navigation like this example:

```ruby

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

connection :navigation, :adaptor => :ardrone_navigation
device :nav, :driver => :ardrone_navigation, :connection => :navigation

work do
  on drone, :ready => :fly
  drone.start(nav) # pass the nav object into the start method
end

def fly(*data)
  drone.take_off
  after(15.seconds) { drone.hover.land }
  after(20.seconds) { drone.stop }
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
