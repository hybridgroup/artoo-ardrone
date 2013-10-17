require 'artoo'

connection :ardrone, :adaptor => :ardrone, :port => '192.168.1.1:5556'
device :drone, :driver => :ardrone, :connection => :ardrone

connection :videodrone, :adaptor => :ardrone_video, :port => '192.168.1.1:5555'
device :video, :driver => :ardrone_video, :connection => :videodrone

work do
  on drone, :ready => :fly
  on video, :frame => :v_frame

  drone.start
end

def fly
  drone.take_off
  after(15.seconds) { drone.hover.land }
  after(20.seconds) { drone.stop }
end

def v_frame(*data)
	@count ||= 0
	@count += 1
  puts "Frame# #{@count} #{data[1].size} bytes"
end
