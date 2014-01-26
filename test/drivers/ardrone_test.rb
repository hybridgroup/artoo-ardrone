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
    it 'starts without nav when nav is nil' do
    	@connection.expects(:start).with(false)
    	@device.expects(:event_topic_name).with("ready")
    	@driver.start(false)
    end

    it 'starts with nav when nav is not nil' do
    	@connection.expects(:start).with(false)
    	@driver.stubs(:start_with_nav).returns([])
    	@driver.start(true)
    end
  end

  describe 'Ardrone#start_with_nav' do
    before do
      @nav = mock('navigation')
    end

    it 'starts with nav when theres no emergency landing' do
      @nav.stubs(:emergency_landing?).returns(false)
      @device.expects(:event_topic_name).with("ready")
      @driver.start_with_nav(@nav)
    end

    it 'starts with nav when theres an emergency landing' do
      @nav.stubs(:emergency_landing?).twice.returns(true)
      @connection.expects(:disable_emergency)
      @driver.start_with_nav(@nav)     
    end
  end

  describe 'Ardrone#enable_emergency' do
    it 'enables emergency' do
      @connection.expects(:enable_emergency)
      @driver.enable_emergency
    end
  end

  describe 'Ardrone#disable_emergency' do
    it 'disables emergency' do
      @connection.expects(:disable_emergency)
      @driver.disable_emergency
    end
  end
end
