# Artron

Communicates with temperature sensors and luminosity connected to an Arduino and publishes a MQTT broker. I used gem [Artoo](https://github.com/hybridgroup/artoo) to perform communication with the Arduino.

## Installation

```console
$ bundle
```

## Usage

Change `connection_params` in [bin/artron](https://github.com/sergioaugrod/artron/blob/master/bin/artron):

```ruby
connection_params = {
  mqtt: {
    host: 'localhost', 
    username: '',
    password: '',
    port: 1883,
    ssl: false
  },
  worker: {
    port: '/dev/cu.usbmodem1421'
  }
}
```

```console
$ bin/artron 
```

## Contributing

1. Clone it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
