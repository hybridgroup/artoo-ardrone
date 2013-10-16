require 'artoo'

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  drone.start

  after(2) { drone.take_off }
  after(15.seconds) { drone.hover.land }
  after(20.seconds) { drone.stop }
end
