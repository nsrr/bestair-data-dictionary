require 'test_helper'
require 'colorize'

class DictionaryTest < Minitest::Test
  # This line includes all default Spout Dictionary tests
  include Spout::Tests

  # This line provides access to @variables, @forms, and @domains
  # iterators that can be used to write custom tests
  include Spout::Helpers::Iterators

  VALID_UNITS = ['years', 'minutes (min)', 'percent (%)', 'events per hour', 'miligrams per decilitre (mg/dL)', 
   'milligrams per litre (mg/L)', 'micrograms per millilitre (ug/mL)','picograms per millilitre (pg/mL)',
   'milli-international units per millilitre (uIU/mL)', 'nanograms per millilitre (ng/mL)', 
   'millilitres per minute per 1.73 squared meters (mL/min per 1.73 m2)', 
   'centimeters (cm)', 'kilograms per squared meter (kg/m2)', 'millimeters of mercury (mmHg)', 
   'millilitres (ml)', 'grams (g)', 'grams per squared meter (g/m2)', 
   'millilitres per squared meter (ml/m2)', 'centimeters per second (cm/sec)', 'squared centimeters (cm2)', 
   'Wood','']

  @variables.select{|v| ['numeric','integer'].include?(v.type)}.each do |variable|
    define_method("test_units: "+variable.path) do
      message = "\"#{variable.units}\"".colorize( :red ) + " invalid units.\n" +
                "             Valid types: " +
                VALID_UNITS.sort.collect{|u| u.inspect.colorize( :white )}.join(', ')
      assert VALID_UNITS.include?(variable.units), message
    end
  end

end
