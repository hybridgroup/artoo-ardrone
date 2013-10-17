require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # Ardrone navigation driver behaviors
    class ArdroneNavigation < Driver
      COMMANDS = [:emergency_landing?].freeze

      # Starts driver and handle updates from device
      def start_driver
        every(interval) do
          handle_update
        end

        super

        publish(event_topic_name("ready"))
      end

      # Receives data from navigation and publishes
      # and event in update topic for it
      def handle_update
        navdata = connection.receive_data
        return unless navdata

        @emergency_landing = navdata.emergency_landing?
puts @emergency_landing
        navdata.options.each do |opt|
          n = navdata.clone
          n.options = opt

          case
          when opt.is_a?(::Argus::NavOptionDemo) 
            publish(event_topic_name("update"), "navdata_demo", n, opt)
            publish(event_topic_name("demo"), n, opt)

          when opt.is_a?(::Argus::NavOptionVisionDetect)
            publish(event_topic_name("update"), "navdata_vision_detect", n, opt)
            publish(event_topic_name("vision_detect"), n, opt)

          end
        end

        publish(event_topic_name("update"), "navdata", navdata)
        publish(event_topic_name("navdata"), navdata)
      end

      def emergency_landing?
        #@emergency_landing = false if @emergency_landing.nil?
        @emergency_landing
      end
    end
  end
end
