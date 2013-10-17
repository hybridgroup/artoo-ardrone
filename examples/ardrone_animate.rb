require 'artoo'

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

connection :navigation, :adaptor => :ardrone_navigation
device :nav, :driver => :ardrone_navigation, :connection => :navigation

work do
  on drone, :ready => :fly
  drone.start(nav)
end

def fly(*data)
  drone.take_off
  after(10.seconds) { drone.animate(:turnaround, 3000) }
  after(15.seconds) { drone.hover.land }
  after(20.seconds) { drone.stop }
end
