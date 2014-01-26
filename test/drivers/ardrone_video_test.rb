require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/ardrone_video'

describe Artoo::Drivers::ArdroneVideo do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::ArdroneVideo.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
    @video = mock('video')
  end

  describe 'ArdroneVideo#start_driver' do
    it 'starts drives and handles video frame' do
      @device.expects(:interval).returns(0.01)
      @driver.start_driver
    end
  end

  describe 'ArdroneVideo#handle_frame' do
    it 'retrieves frame and publishes data' do
      @connection.expects(:receive_data).returns(@video)
      @device.expects(:event_topic_name).with('update')
      @device.expects(:event_topic_name).with('frame')
      @video.expects(:frame)
      @driver.handle_frame
    end
  end
end
