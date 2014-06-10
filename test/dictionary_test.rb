require 'test_helper'
require 'colorize'

class DictionaryTest < Minitest::Test
  # This line includes all default Spout Dictionary tests
  include Spout::Tests

  # This line provides access to @variables, @forms, and @domains
  # iterators that can be used to write custom tests
  include Spout::Helpers::Iterators

  VALID_UNITS = ['minutes', 'times per week', 'hours', 'millimeters of water', 'units', 'nights', 'centimeters of water',
   'metabolic equivalents', 'cigarettes per day', 'units', 'periods', 'ovaries', 'millimeters', 'centimeters', 'feet',
   'pounds', 'inches', 'readings', 'kilograms per meter squared', 'meters per second', 'centimeters per second',
   'grams', 'grams per meter squared', 'milliliters', 'percent', 'millimeters of mercury', 'milligrams per liter',
   'milligrams per deciliter', 'micrograms per deciliter', 'centimeters squared', 'milliliters per meter squared',
   'Wood units', 'days', 'beats per minute', 'kilograms', 'years', 'events per hour', 'hours per week', '']

  @variables.select{|v| ['numeric','integer'].include?(v.type)}.each do |variable|
    define_method("test_units: "+variable.path) do
      message = "\"#{variable.units}\"".colorize( :red ) + " invalid units.\n" +
                "             Valid types: " +
                VALID_UNITS.sort.collect{|u| u.inspect.colorize( :white )}.join(', ')
      assert VALID_UNITS.include?(variable.units), message
    end
  end

end
