## 0.6.1 (October 11, 2022)

- Revise variable labeling for whiirs_total, prom_satisfied and ahi_primary
- The CSV dataset is located here:
  - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.6.1\`

## 0.6.0 (March 15, 2022)

- Incorporate the core set of NSRR harmonized terms (nsrr_*)
- Update many variable labels
- Add **awave** variable from EKG results
- The CSV dataset is located here:
  - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.6.0\`

## 0.5.0 (June 24, 2019)

- Fix form link for PHQ-8
- Add PHQ-8 and WHIIRS variables
- The CSV dataset is located here:
  - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.5.0\`

## 0.4.0 (June 20, 2019)

- Add individual Epworth items
- The CSV dataset is located here:
  - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.4.0\`

## 0.3.0 (May 31, 2019)

- Add individual PROMIS sleep scale items
- Clarify labels of PROMIS summary scores
- The CSV dataset is located here:
  - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.3.0\`
- **Gem Changes**
  - Update to ruby 2.6.1
  - Update to spout 1.0.0

## 0.2.1 (January 7, 2019)

- Update form names to include parentheses
- Tweak description in `whiirs_total` variable for WHIIRS harmonization effort
- **Gem Changes**
  - Updated to spout 0.14.1

## 0.2.0 (June 25, 2018)

### Changes
- **General Changes**
  - Delete domains, scripts, and variables
  - Upload updated domains, scripts, and variables
  - Modify units listed in dictionary_test.rb
  - Add medical and health history variables
  - Add visit number
  - Modify domain and variable description for treatment arm variable
  - Fix variable units and display names
  - Add forms to variables
  - The CSV dataset is located here:
    - `\\rfawin\bwh-sleepepi-bestair\nsrr-prep\_releases\0.2.0\`

- **Gem Changes**
  - Use of Ruby 2.5.1 is now recommended
  - Updated to spout 0.13.0

## 0.1.1 (June 10, 2014)

### Changes
- **Gem Changes**
  - Use of Ruby 2.1.2 is now recommended
  - Updated to spout 0.8.0.rc2

## 0.1.0 (March 21, 2014)

### Changes
- The CSV dataset generated from [the SAS export](https://github.com/sleepepi/bestair-data-dictionary/blob/master/scripts/datasetexport.sas) is located here:
  - `\\rfa01\bwh-sleepepi-bestair\nsrr-prep\_releases\0.1.0\`
    - `bestair-dataset-0.1.0.csv`
- **Changes in Source Data**
  - Extreme values for numeric variables have been validated against the source data in REDCap
    - Incorrect instances of extreme values have been fixed in the source itself
- **Changes Made by Export Script**
  - The export script is included in the `scripts` folder
  - The BestAIR SAS export script modifies the dataset exported from the source data in the following manner:
    - Adds newly calculated averages from permanent SAS datasets
    - Creates a single, categorical race variable for all participants
    - Tracking and administrative variables have been removed
    - Identifiers, including dates, are removed
    - Missing codes stripped out of data from questionnaires and data on CRF forms that are numeric variables
      - Allows for means and other statistics to be run on numeric variables without needing to account for missing codes
