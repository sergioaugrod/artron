require 'spec_helper'

describe Artron::Worker do
  let(:port) { '/dev/1234' }
  let(:instance) { Artron::Worker.new(port) } 

  describe '#initialize' do
    subject { described_class.new(port) }

    it { is_expected.to be_instance_of(Artron::Worker) }
  end

  describe '.connection_types' do
    let(:connection_types) { [{name: :arduino}] }

    subject { described_class.connection_types }

    it { is_expected.to eq connection_types }
  end

  describe '.device_types' do
    let(:device_types) { [{name: :sensor}, {name: :sensor}] }

    subject { described_class.device_types }

    it { is_expected.to eq device_types }
  end

  describe '#work' do
    let(:timers_instance) { double(Timers::Timer) }

    subject { instance.work }

    before do
      expect(instance).to receive(:work).and_return(timers_instance)
    end

    it { is_expected.to eq timers_instance }
  end
end
