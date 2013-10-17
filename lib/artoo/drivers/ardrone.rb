require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # Ardrone driver behaviors
    # @see https://github.com/hybridgroup/argus/blob/master/lib/argus/drone.rb Argus::Drone docs for supported actions
    class Ardrone < Driver
      COMMANDS = [:start, :stop, :hover, :land, :take_off, :enable_emergency, :disable_emergency,
                  :front_camera, :bottom_camera, :up, :down, :left, :right, 
                  :forward, :backward, :turn_left, :turn_right, :reset_watchdog, :led, :animate].freeze

      def start(nav=nil)
        connection.start(false) # send false, so Argus does not use NavMonitor

        if nav
          start_with_nav(nav)
        else
          publish(event_topic_name("ready"))
        end
      end

      def start_with_nav(nav)
        until !nav.emergency_landing?.nil?
          sleep 0.1
        end

        if nav.emergency_landing?
          connection.disable_emergency
          after(1) do
            connection.disable_emergency(false)
            publish(event_topic_name("ready"))
          end
        else
          publish(event_topic_name("ready"))
        end
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
