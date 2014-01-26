require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/ardrone_navigation'

describe Artoo::Drivers::ArdroneNavigation do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::ArdroneNavigation.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
    @navdata = mock('navdata')
  end

  describe 'ArdroneNavigation#start_driver' do
    it 'starts driver and handles updates' do
      @device.expects(:interval).returns(0.01)
      @device.expects(:event_topic_name).with('ready')
      @driver.start_driver
    end
  end

  describe 'ArdroneNavigation#handle_update' do
    it 'receives data and publishes demo when demo option' do
      @connection.expects(:receive_data).returns(@navdata)
      @navdata.stubs(:emergency_landing?)
      @navdata.expects(:options).returns([::Argus::NavOptionDemo])
      @navdata.expects(:options=).with(Argus::NavOptionDemo)
      @device.expects(:event_topic_name).with('update')
      @device.expects(:event_topic_name).with('navdata') 
      @driver.handle_update
    end

    it 'receives data and publishes vision_detect when vision_detect option' do
      @connection.expects(:receive_data).returns(@navdata)
      @navdata.stubs(:emergency_landing?)
      @navdata.expects(:options).returns([::Argus::NavOptionVisionDetect])
      @navdata.expects(:options=).with(Argus::NavOptionVisionDetect)
      @device.expects(:event_topic_name).with('update')
      @device.expects(:event_topic_name).with('navdata') 
      @driver.handle_update
    end
  end

  describe 'ArdroneNavigation#emergency_landing?' do
    it 'returns emergency_landing value' do
      @driver.emergency_landing?
    end
  end
end
