require 'yaml'
require 'samer/data_provider'
require 'samer/engine'

module Samer

  def self.find_for name
    DataProvider.new
    @engine ||= Engine.new(DataProvider.new.prepare) # Шаблон компоновщик.
    @engine.find_for name # Шаблон делегирования.
  end

  def self.recommend name
    find_for(name)
    @engine.recommend(name) # Шаблон делегирования.
  end

end
