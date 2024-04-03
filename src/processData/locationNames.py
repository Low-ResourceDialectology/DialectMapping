# -*- coding: utf-8 -*-
# Python Script for Dialect Mapping project
# 
# Authors: Christian "Doofnase" Schuler
###############################################################################


import argparse
import csv
import json
import logging
import os
import sys
import textwrap


""" Usage
cd ~/RStudio_Projects/DialectMapping/src/process

source ./../../environments/venvDM01/bin/activate

# =============================================================================
# Extract Geolocation Names from R-Script output
# INPUT: kurdistan_names_level2_wide.csv 
# OUTPUT: kurdistan_names_level2_wide.json
python locationNames.py --modeExecution getLocatioNamesJson --csvFile ./../../data/processed/fromR/level2/kurdistan_names_wide.csv --debug
#TODO: python locationNames.py --modeExecution getLocatioNamesJson --csvFile ./../../data/processed/fromR/level1/kurdistan_names_wide.csv --debug


# =============================================================================
# Extract Geolocation Names from R-Script output
# INPUT: kurdistan_names_level2_wide.json
# OUTPUT: kurdistan_names_level2_wide.txt
python locationNames.py --modeExecution getLocatioNamesList --jsonFile ./../../data/processed/fromR/level2/kurdistan_names_wide.json --debug
#TODO: python locationNames.py --modeExecution getLocatioNamesList --jsonFile ./../../data/processed/fromR/level1/kurdistan_names_wide.json --debug


# =============================================================================
# Find Links between Location Names (from R) and Variety Names (from Python)
python locationNames.py --modeExecution locationLinkVariety --debug



"""


"""
Linking Geolocation Names and Language Variety Names
"""
def main(args, loglevel):
    logging.basicConfig(format="%(levelname)s: %(message)s", level=loglevel)

    # =========================================================================
    # Basic Functionalities
    """
    Create a new directory if it does not already exist
    """
    def create_directory(directory_path):

        #logging.info(f'  Creating new directory')
        #logging.debug(f'Creating directory: {directory_path}')
        
        # Attempt to create directory
        try:
            os.makedirs(directory_path)
        
        # Directory already exists
        except FileExistsError:
            pass
            #logging.debug(f'Directory already exists: {directory_path}')

    """
    Get the filename (without extension) from an entire path
    INPUT: "InterdialectCorpus/master/KMR-ENG/KMR-ENG.KMR_no_tag.txt"
    OUTPUT: "KMR-ENG.KMR_no_tag"
    """
    def get_filename_without_extension(directory_path):
        filename_without_extension = os.path.splitext(os.path.basename(directory_path))[0]
        return filename_without_extension
        """
        NOTE: os.path.splitext() split at the last (right) dot . 
            "KMR-ENG.KMR_no_tag.txt" → "KMR-ENG.KMR_no_tag"
        NOTE: os.path.split() to split by the first (left) dot .
            "KMR-ENG.KMR_no_tag.txt" → "KMR-ENG"
        """

    """
    Get directory basename from entire path
    INPUT: /transcribed/split_end/filename.txt
    INTERMEDIATE: /transcribed/split_end
    OUTPUT: split_end
    
    """
    def get_dirname_basename(directory_path):
        dirname = os.path.dirname(directory_path)

        base_dirname = dirname.split('/')[-1]

        return base_dirname

    

    """
    Read content from (csv) file
    """
    def csv_to_content(input_csv):
            
        # Ensure valid file naming
        if not input_csv.endswith('.csv'):
            logging.debug(f'Input file seems not to be a .csv file!')
        else:

            # List for content read from csv
            csv_content = []

            # Read .csv file row for row
            with open(input_csv, newline='') as csvfile:
                csv_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
                for row in csv_reader:
                    # Replace linebreaks
                    row_clean = row
                    #row_clean = row.replace('\n','')
                    #row_clean = [item.replace('\n','') for item in row] # Does not work?? Issue example: "Samsun Merkezi\n Merkezi"
                    # NOTE: Manually replaced 4 occurrences of '\n' in the file data/processed/fromR/level2/kurdistan_names_wide.csv

                    csv_content.append(row_clean)

            return csv_content
            
    
    """
    Clean content from (csv) file to be saved in (json) file
    """
    def raw_to_clean_content(input_content):
        
        # List for content read from csv
        clean_content = {}

        # Read content row for row (ignore first, since it is the header)
        for location_item in input_content[1:]:
            #logging.debug(f'location_item_list: {location_item}')
            # →  location_item = ['AFG', 'Afghanistan', 'AFG.1_1', 'Badakhshan', 'NA', 'AFG.1.1_1', 'Baharak', 'NA', 'NA', 'Wuleswali', 'District', 'NA', 'AF.BD.BA']

            # Take the last column (GID_2) as the items identifying name
            new_item_name = location_item[5] 
            #logging.debug(f'new_item_name: {new_item_name}')
            # → new_item_name = 'AFG.1.1_1'

            # Take the entries from all the other columns as values in new item dictionary
            new_item = {
                "GID_0": location_item[0],
                "COUNTRY": location_item[1],
                "GID_1": location_item[2],
                "NAME_1": location_item[3],
                "NL_NAME_1": location_item[4],
                "GID_2": location_item[5],
                "NAME_2": location_item[6],
                "VARNAME_2": location_item[7],
                "NL_NAME_2": location_item[8],
                "TYPE_2": location_item[9],
                "ENGTYPE_2": location_item[10],
                "CC_2": location_item[11],
                "HASC_2": location_item[12]
            }

            # Add new item to the clean dictionary
            clean_content[new_item_name] = new_item


        return clean_content
            
    
    """
    Write content to (json) file
    """
    def content_to_json(input_content, output_file, output_file_encoding='utf-8'):
            
        # Ensure valid file extension
        if not output_file.endswith('.json'):
            output_file = output_file + '.json'

        # Serializing jsons
        json_object = json.dumps(input_content, indent=4, ensure_ascii=False)

        # Writing to json file
        with open(f'{output_file}', "w", encoding=output_file_encoding) as outfile:
            outfile.write(json_object)


    """
    Write text to .txt file
    """
    def content_to_txt(input_text, output_file):

        with open(f'{output_file}', 'w') as output_text_file:
            
            # Writing single String
            if type(input_text) == str:
                output_text_file.write(input_text)

            # Writing list of Strings
            elif isinstance(input_text, list):
                
                # For each line of text
                for text_line in input_text:

                    # Replace all linebreak inside text_line and then add a single linebreak at end of line
                    # This way we deal with "clean lines" without '\n' at the end and with "dirty lines" that have one
                    output_text_file.write(text_line.replace('\n','')+'\n')

                    # TODO: Handling cases where we want multiple linebreaks inside one part of to be written text(?)
                    # Check if the string ends with a linebreak ('\n')


    # =========================================================================
    # Start of Script Execution
                    
    # Execute according to mode parameter
    if args.modeExecution == "getLocatioNamesJson":
        logging.debug(f'Getting Location Names from R-Script Output as Dictionary in .json File.')

        input_file = args.csvFile
        output_file = input_file[:-4]+'.json'

        # Read content from .csv file
        content_location_info_raw = csv_to_content(input_file)

        # Clean up the content
        content_location_info = raw_to_clean_content(content_location_info_raw)

        # Write content to .json file
        content_to_json(content_location_info, output_file)


    elif args.modeExecution == "getLocatioNamesList":
        logging.debug(f'Getting Location Names from R-Script Output as plain List in .txt File.')
    
        input_file = args.jsonFile

        # Read content from .json file
        with open(input_file, 'r') as f:
            location_data = json.load(f)

        # Extract names of location for different administrative levels
        list_all = []
        list_0_country = []
        list_1_state = []
        list_1_state_local = []
        list_2_district = []
        list_2_district_local = []
        #list_2_district_alt = []

        # For each known location
        for key in location_data.keys():
            location_item = location_data[key]
            #logging.debug(f'location_item: {location_item}')

            # Extract country name
            country = location_item["COUNTRY"]
            list_0_country.append(country)
            list_all.append(country)
            
            # Extract "state" name
            state = location_item["NAME_1"]
            list_1_state.append(state)
            list_all.append(state)

            # Extract local "state" name if exists
            if not location_item["NL_NAME_1"] == "NA":
                state_local = location_item["NL_NAME_1"]
                list_1_state_local.append(state_local)
            
            # Extract "district" name
            district = location_item["NAME_2"]
            
            #logging.debug(f'district: {district}')
            #logging.debug(f'district[0]: {district[0]}')
            # In case of multiple district names, they are seperated by a |
            if '|' in district:
                logging.debug(f'Found a | in district')
                district_names = district.split('|')

                for alt_name in district_names:
                    list_2_district.append(alt_name)
                    list_all.append(alt_name)
            
            # Sometimes two names are seperated by a /
            if '/' in district:
                logging.debug(f'Found a / in district')
                district_names = district.split('/')

                for alt_name in district_names:
                    list_2_district.append(alt_name)
                    list_all.append(alt_name)
            
            # If there is only one district name
            else:
                list_2_district.append(district)
                list_all.append(district)
        
            # Extract local "district" name if exists
            if not location_item["NL_NAME_2"] == "NA":
                district_local = location_item["NL_NAME_2"]

                # In case of multiple local names, they are seperated by a |
                if '|' in district_local:
                    district_local_names = district_local.split('|')
                    logging.debug(f'Found a | in district_local')

                    for local_name in district_local_names:
                        list_2_district_local.append(local_name)
                        list_all.append(local_name)
                
                # If there is only one local name
                else:
                    list_2_district_local.append(district_local)
                    list_all.append(district_local)

            # Extract alternative "district" name if exists
            if not location_item["VARNAME_2"] == "NA":
                district_alt = location_item["VARNAME_2"]
                
                # In case of multiple local names, they are seperated by a |
                if '|' in district_alt:
                    district_alt_names = district_alt.split('|')
                    logging.debug(f'Found a | in district_alt')

                    for alt_name in district_alt_names:
                        list_2_district.append(alt_name)
                        list_all.append(alt_name)
                
                # If there is only one local name
                else:
                    list_2_district.append(district_alt)
                    list_all.append(district_alt)



        # Remove duplicates via: List to Set to List
        list_all_unique = list(set(list_all))
        list_0_country_unique = list(set(list_0_country))
        list_1_state_unique = list(set(list_1_state))
        list_1_state_local_unique = list(set(list_1_state_local))
        list_2_district_unique = list(set(list_2_district))
        list_2_district_local_unique = list(set(list_2_district_local))
        #list_2_district_alt_unique = list(set(list_2_district_alt))

        # Save location names to .txt files
        output_file = input_file[:-5]+'_all.txt'
        content_to_txt(list_all_unique, output_file)

        output_file = input_file[:-5]+'_countries.txt'
        content_to_txt(list_0_country_unique, output_file)

        output_file = input_file[:-5]+'_states.txt'
        content_to_txt(list_1_state_unique, output_file)

        output_file = input_file[:-5]+'_states_local.txt'
        content_to_txt(list_1_state_local_unique, output_file)


        output_file = input_file[:-5]+'_districts.txt'
        content_to_txt(list_2_district_unique, output_file)

        output_file = input_file[:-5]+'_districts_local.txt'
        content_to_txt(list_2_district_local_unique, output_file)

        #output_file = input_file[:-5]+'districts_alternative.txt'
        #content_to_txt(list_2_district_alt_unique, output_file)


    elif args.modeExecution == "locationLinkVariety":
        logging.debug(f'Checking Location Names in Variety Information from Python-Script Output.')
        

    else:
        print("Unknown mode for execution.")




# Standard boilerplate to call the main() function to begin the program.
if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        #prog='PROG',
        #description=__doc__,
        description=textwrap.dedent('''\
            Description of Script/Module
            ---------------------------------------------
            For more information check out the github repository:
            #TODO
            '''),
        epilog = "As an alternative to the commandline, params can be placed in a file, one per line, and specified on the commandline like '%(prog)s @params.conf'.",
        fromfile_prefix_chars = '@' )
        # Specify your real parameters here:
    parser.add_argument("--debug",action="store_true", help="printing for easy debugging.")
    parser.add_argument("--verbose",action="store_true", help="increase output verbosity.")
    parser.add_argument('--modeExecution', type=str, help='mode of execution for this script.')
    parser.add_argument('--csvFile', type=str, help='input file for current execution.')
    parser.add_argument('--jsonFile', type=str, help='input file for current execution.')
    parser.add_argument('--languages', type=str, nargs='+', default='None', help='list of language ids.')
    
    # The 'action="store_true"' is used to store the default value "False" and only contain "True" if the flag has been set.
    # Example: we define --dwarf, action='store_true' and --fortress, action='store_false'
    #          we call the script with --dwarf --fortress → dwarf=True and fortress=False
    #          we call the script with --dwarf            → dwarf=True and fortress=True
    #          we call the script with         --fortress → dwarf=False and fortress=False
    #          we call the script with                    → dwarf=False and fortress=True

    args = parser.parse_args()
    
    #print("Debug: Argument parsing done")

    # Setup logging
    if args.debug:
        loglevel = logging.DEBUG
    elif args.verbose:
        loglevel = logging.INFO
    else:
        loglevel = logging.ERROR
    
    main(args, loglevel)
