module Artron
  class Conversors
    def self.luminosity(value)
      value.fdiv(1023) * 100
    end

    def self.temperature(value)
      resistance = (10240000 / value) - 10000

      temperature = Math.log(resistance)
      # Steinhart-Hart Equation
      temperature = 1 / (0.001129148 + (0.000234125 * temperature) + (0.0000000876741 * temperature**3))
      temperature = temperature - 273.15

      temperature.round(2)
    end
  end
end
