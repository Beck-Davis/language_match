# Language_Match
A ruby script for catalogers to find matching [ISO 639-3 Language Codes](https://iso639-3.sil.org/about) for bulk MARC records.

## Description
This project processes the MARC 546 field and matches language names to their corresponding ISO 639-3 codes. This is designed to enhance cataloging workflows by automating language code identification, giving catalogers potential matches for review for multiple MARC records at a time.

Quality matches depend on spelling matches between the ISO 639-3 table and the field 546 value.

## Getting Started
This script will require use of the command line. Users will need to install the dependencies, enter the filepath of the MARC records to evaluate, and the destination filepath for the tsv file. 

### Installing
1. Clone this repository  
```bash
git clone https://github.com/Beck-Davis/language_match.git
```
2. Install dependencies
```bash
bundle install
```

### Dependencies
To use this script, the input file must be in MARCXML or XML format. The file name may look like `examplefile.marcxml` or `examplefile.xml`. You may need to use a tool such as [Marcedit](https://marcedit.reeset.net/downloads) to reformat the file from `example.mrc` or `example.mrk`. You may also consider exporting the files directly from your ILS in marcxml or xml format. 


### Usage
1. Run the script with the following command:
```bash
ruby language_match.rb
```
2. When prompted enter the filepath of the marcxml or xml file containing the MARC records.  
3. When prompted enter the filepath where you wish to save the resulting .tsv file

#### Post-processing
Once the process is complete, you may wish to import the .tsv file to a spreadsheet software such as Microsft Excel or [Google Sheets](https://support.google.com/area120-tables/answer/9904106?hl=en#import-sheets).


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
