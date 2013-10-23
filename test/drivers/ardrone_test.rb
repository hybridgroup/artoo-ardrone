require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/ardrone'

describe Artoo::Drivers::Ardrone do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::Ardrone.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
  end

  it 'Ardrone#start with nav' do
  	@connection.expects(:start).with(true)
  	@device.expects(:start_with_nav).with(true)
  	@driver.start(true)
  end

end
