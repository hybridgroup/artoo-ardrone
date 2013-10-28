require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/ardrone'

describe Artoo::Drivers::Ardrone do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::Ardrone.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
  end

  describe 'Ardrone#start' do
    it 'it starts without nav when nav is nil' do
    	@connection.expects(:start).with(false)
    	@device.expects(:event_topic_name).with("ready").returns("hi_ready")
    	@driver.start(false)
    end

    it 'it starts with nav when nav is not nil' do
    	@connection.expects(:start).with(false)
    	@driver.stubs(:start_with_nav).returns([])
    	@driver.start(true)
    end
  end
end
