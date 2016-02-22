module Artron
  class Client
    def initialize(params = {})
      mqtt = Artron::MQTT.new(params[:mqtt]).connect
      port = params[:worker][:port]

      @worker = Artron::Worker.new(port, mqtt)
    end

    def work
      @worker.work
    end
  end
end
