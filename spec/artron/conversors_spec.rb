require 'spec_helper'

describe Artron::Conversors do
  describe '.luminosity' do
    subject { described_class.luminosity(luminosity) }

    context 'when max luminosity' do
      let(:luminosity) { 1023 }

      it { is_expected.to eq 100 }
    end

    context 'when mid luminosity' do
      let(:luminosity) { 511.5 }

      it { is_expected.to eq 50 }
    end
  end

  describe '.temperature' do
    subject { described_class.temperature(temperature) }

    context 'when valid temperature' do
      let(:temperature) { 400 }

      it { is_expected.to eq 15.16 }
    end

    context 'when invalid temperature' do
      let(:temperature) { -1 }

      it { expect{subject}.to raise_error(Math::DomainError) }
    end
  end
end
