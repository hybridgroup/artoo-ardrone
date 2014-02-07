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
  drone.start
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

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing

* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
