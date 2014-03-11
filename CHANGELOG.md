## 0.1.0

### Changes
- The CSV dataset generated from [BestAIR SAS](https://github.com/sleepepi/bestair-sas) is located here:
  - `\\rfa01\bwh-sleepepi-bestair\Data\SAS\_datasets\`
    - `bestair-dataset-0.1.0.rc.csv`
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
