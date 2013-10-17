require 'artoo'

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  on drone, :ready => :fly
  drone.start
end

def fly
  drone.take_off
  after(15.seconds) { drone.animate(:turnaround, 15) }
  after(35.seconds) { drone.hover.land }
  after(40.seconds) { drone.stop }
end
