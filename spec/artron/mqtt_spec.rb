require 'spec_helper'

describe Artron::MQTT do
  let(:attrs) { { host: 'localhost', port: 1883 } }

  describe '#initialize' do
    subject { described_class.new(attrs) }

    its(:host) { is_expected.to eq attrs[:host] }
    its(:port) { is_expected.to eq attrs[:port] }
  end

  describe '#connect' do
    subject { described_class.new(attrs).connect }

    let(:attrs) { { host: 'localhost', port: 1883 } }
    let(:mqtt_client_instance) { ::MQTT::Client.new(host: 'localhost', port: 1883) }

    before do
      expect(::MQTT::Client).to receive(:connect).and_return(mqtt_client_instance)
    end

    it { is_expected.to be_instance_of(MQTT::Client) }

    its(:host) { is_expected.to eq attrs[:host] }
    its(:port) { is_expected.to eq attrs[:port] }
  end
end
