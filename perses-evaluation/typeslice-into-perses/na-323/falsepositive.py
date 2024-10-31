#call this file with 'python falsepositive.py cf-4614 <path to expected log> <path to existing log>'
#for now I assume the json with the relevant data is in the same directory as this
import json
import re
import os
import sys
import subprocess
import shutil
from Keyvalue import JsonKeys
from Result import Result
from report_builder import TableGenerator
from exception_data import ExceptionData
import zipfile
import platform
import tarfile
import glob
import stat
import argparse
import time
import math
import statistics
#ripped pattern data function from TypeSlice eval repo
def compare_pattern_data(expected_log_path, actual_log_path, bug_pattern_data):
    with open(expected_log_path, "r") as file:
        expected_log_file_content = file.read()

    with open(actual_log_path, "r") as file:
        actual_log_file_content = file.read()

    #Algorithm steps:
    #1.extract data from expected log file. One matched item should be there since only desired log information is in expected log file
    #2.extract data from build log file. Multiple matched items can be found. 
    #3.checked if item of st:2 is in items of st:3. if not there immediate return False. otherwise continue
    #4.return True at method end since no mismatch found.
    for key in bug_pattern_data:
        pattern = bug_pattern_data[key]
        expected_content = re.search(pattern, expected_log_file_content)
        if not expected_content: #TODO: this should trigger error. it indicates pattern error 
            return False
        expected_content = expected_content.group(1) 
        actual_content = re.findall(pattern, actual_log_file_content)

        if key == "file_pattern":
            expected_content = os.path.basename(expected_content)
            actual_content = [os.path.basename(item) for item in actual_content]

        if expected_content in actual_content:
            continue
        else:
            return False

    return True

def read_json_from_file(file_path):
    '''
    Parse a json file.

    Parameters:
        file_path (path): Path to the json file

    Retruns:
        { }: Parsed json data
    '''
    try:
        with open(file_path, 'r') as file:
            json_data = json.load(file)
        return json_data
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return None
    except FileNotFoundError:
        print(f"File not found: {file_path}")
        return None

def main():
    #okay :rat:
    #json_path = "test_data.json"
    json_path = sys.argv[4]
    expected_log = sys.argv[2]
    actual_log = sys.argv[3]
    #print("expected: " + expected_log)
    #print("recieved: " + actual_log)
    #print("json: " + json_path)
    jsondata=read_json_from_file(json_path)
    #read a single issue from arguments
    inputissue = sys.argv[1]
    #print("Checking issue " + inputissue)
    for issue in jsondata:
        if issue["issue_id"] == inputissue:
            #print(issue)
            success = compare_pattern_data(expected_log, actual_log, issue[JsonKeys.BUG_PATTERN.value])
    #os.remove(actual_log)
    print(success)
    if success:
        exit(0)
    else:
        exit(1)
main()

