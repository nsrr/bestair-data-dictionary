require 'test_helper'

class DictionaryTest < Test::Unit::TestCase
  include Spout::Tests

  VALID_UNITS = ['minutes', 'hours', 'millimeters of water', 'units', 'nights', 'centimeters of water',
   'metabolic equivalents', 'unit count', 'years old', 'event count', 'millimeters', 'centimeters', 'feet',
   'pounds', 'inches', 'kilograms per meter squared', 'meters per second', 'centimeters per second',
   'grams', 'grams per meter squared', 'milliliters', 'percent', 'millimeters of mercury', 'milligrams per liter',
   'milligrams per deciliter', 'micrograms per deciliter', 'centimeters squared', 'milliliters per meter squared',
   'Wood units', 'days', 'beats per minute', 'kilograms', 'years', 'events per hour', 'hours per week', '']

  def assert_units(units, msg = nil)
    full_message = build_message(msg, "? invalid units. Valid types: #{VALID_UNITS.join(', ')}", units)
    assert_block(full_message) do
      VALID_UNITS.include?(units)
    end
  end

  Dir.glob("variables/**/*.json").each do |file|
    if ['numeric','integer'].include?(json_value(file, :type))
      define_method("test_units: "+file) do
        assert_units json_value(file, :units)
      end
    end
  end
end
