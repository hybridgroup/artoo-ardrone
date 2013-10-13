require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # Ardrone driver behaviors
    # @see https://github.com/hybridgroup/argus/blob/master/lib/argus/drone.rb Argus::Drone docs for supported actions
    class Ardrone < Driver
      COMMANDS = [:start, :stop, :hover, :land, :take_off, :emergency, 
                  :front_camera, :bottom_camera, :up, :down, :left, :right, 
                  :forward, :backward, :turn_left, :turn_right, :reset_watchdog, :led].freeze

      def start
        connection.start(false) # send false, so Argus does not use NavMonitor
        disable_emergency
      end

      def enable_emergency
        connection.enable_emergency
        after(1) do
          connection.enable_emergency(false)
        end
      end

      def disable_emergency
        connection.disable_emergency
        after(1) do
          connection.disable_emergency(false)
        end
      end
    end
  end
end
