require 'artoo'

module Artron
  class Worker < Artoo::Robot
    def initialize(port, mqtt = nil)
      @port = port
      @mqtt = mqtt

      super(params) && prepare_work
    end

    def self.connection_types
      [{ name: :arduino }]
    end

    def self.device_types
      [{ name: :sensor }, { name: :sensor }]
    end

    private

    def params
      {}.tap do |params|
        params[:connections] = { arduino: { adaptor: :firmata, port: @port } }
        params[:devices] = {
          sensor: { driver: :analog_sensor, pin: 0, interval: 0.25, upper: 1023, lower: 100 },
          sensor: { driver: :analog_sensor, pin: 1 }
        }
      end
    end

    def prepare_work
      self.class.work do
        sensors
      end
    end

    def luminosity_sensor
      every 1 do
        luminosity = Conversors.luminosity(sensor.analog_read(0))

        puts "Current luminosity #{luminosity}"
        @mqtt.publish('sensors/luminosity', luminosity) if @mqtt
      end
    end

    def temperature_sensor
      every 1 do
        read = sensor.analog_read(1)

        if read > 0
          temperature = Conversors.temperature(read)

          puts "Current temperature is #{temperature}"
          @mqtt.publish('sensors/temperature', temperature) if @mqtt
        end
      end
    end

    def sensors
      luminosity_sensor
      temperature_sensor
    end
  end
end
