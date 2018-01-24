# frozen_string_literal: true

require 'test_helper'

# Launches default Spout tests and custom tests for specific to this dictionary.
class DictionaryTest < Minitest::Test
  # This line includes all default Spout Dictionary tests
  include Spout::Tests

  # This line provides access to @variables, @forms, and @domains iterators
  # that can be used to write custom tests.
  include Spout::Helpers::Iterators

  # Example 1: Create custom tests to show that `integer` and `numeric`
  # variables have a valid unit type.
  VALID_UNITS = [nil, 'years', 'minutes (min)', 'percent (%)', 'events per hour', 'milligrams per deciliter (mg/dL)',
   'milligrams per liter (mg/L)', 'micrograms per milliliter (ug/mL)','picograms per milliliter (pg/mL)',
   'milli-international units per milliliter (uIU/mL)', 'nanograms per milliliter (ng/mL)',
   'milliliters per minute per 1.73 meters squared (mL/min per 1.73 m2)',
   'centimeters (cm)', 'kilograms per meter squared (kg/m2)', 'millimeters of mercury (mmHg)',
   'milliliters (mL)', 'grams (g)', 'grams per meter squared (g/m2)',
   'milliliters per meter squared (mL/m2)', 'centimeters per second (cm/sec)', 'centimeters squared (cm2)',
   'wood','']

  @variables.select { |v| %w(numeric integer).include?(v.type) }.each do |variable|
    define_method("test_units: #{variable.path}") do
      message = "\"#{variable.units}\"".colorize(:red) + " invalid units.\n" +
                "             Valid types: " +
                VALID_UNITS.sort_by(&:to_s).collect { |u| u.inspect.colorize(:white) }.join(', ')
      assert VALID_UNITS.include?(variable.units), message
    end
  end

  # Example 2: Create custom tests to show that variables have 2 or more labels.
  # @variables.select { |v| %w(numeric integer).include?(v.type) }.each do |variable|
  #   define_method("test_at_least_two_labels: #{variable.path}") do
  #     assert_operator 2, :<=, variable.labels.size
  #   end
  # end

  # Example 3: Create regular Ruby tests
  # You may add additional tests here
  # def test_truth
  #   assert true
  # end
end
