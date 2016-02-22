require 'spec_helper'

RSpec.describe Artron::Client do
  let(:params) do
    {
      worker: {
        port: '/dev/981231'
      },
      mqtt: {
        host: 'localhost',
        username: '',
        password: '',
        port: 1883,
        ssl: false 
      }
    }
  end

  let(:mqtt_instance) { Artron::MQTT.new(params[:mqtt]) }
  let(:mqtt_client_instance) { double(MQTT::Client) }
  let(:worker_instance) { double(Artron::Worker) }

  describe '#initialize' do
    subject { described_class.new(params) }

    context 'when valid params' do
      before do
        expect(Artron::MQTT).to receive(:new).with(params[:mqtt]).and_return(mqtt_instance)
        expect(mqtt_instance).to receive(:connect).and_return(mqtt_client_instance)
        expect(Artron::Worker).to receive(:new).with(params[:worker][:port], mqtt_client_instance).and_return(worker_instance)
      end

      it { is_expected.to be_instance_of(Artron::Client) }
    end

    context 'when mqtt has invalid params' do
      let(:params) do 
        {
          worker: {
            port: '/dev/981231'
          },
          mqtt: {}
        }
      end

      it { expect{subject}.to raise_error(RuntimeError) }
    end

    context 'when worker has invalid params' do
      let(:params) do
        {
          mqtt: {
            host: 'localhost',
            username: '',
            password: '',
            port: 1883,
            ssl: false 
          }
        }
      end

      before do
        expect(Artron::MQTT).to receive(:new).with(params[:mqtt]).and_return(mqtt_instance)
        expect(mqtt_instance).to receive(:connect).and_return(mqtt_client_instance)
      end

      it { expect{subject}.to raise_error(NoMethodError) }
    end
  end

  describe '#work' do
    let(:instance) { Artron::Client.new(params) }
    let(:timers_instance) { double(Timers::Timer) }

    before do
      expect(Artron::MQTT).to receive(:new).with(params[:mqtt]).and_return(mqtt_instance)
      expect(mqtt_instance).to receive(:connect).and_return(mqtt_client_instance)
      expect(Artron::Worker).to receive(:new).with(params[:worker][:port], mqtt_client_instance).and_return(worker_instance)
      expect(worker_instance).to receive(:work).and_return(timers_instance)
    end

    subject { instance.work }

    it { is_expected.to eq timers_instance }
  end
end
