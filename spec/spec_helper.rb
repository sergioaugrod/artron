$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'artron'
require 'rspec'
require 'rspec/its'
require 'celluloid'

Celluloid.logger = nil
