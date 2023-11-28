import os
import requests
import json


def compare_json(tool_versions_json_path):
    # Get the upstream JSON from the URL
    upstream_url = 'https://raw.githubusercontent.com/efabless/central_CI/main/tools.json'
    response = requests.get(upstream_url)
    if response.status_code != 200:
        raise ValueError(f'Failed to get upstream JSON from {upstream_url}: {response.status_code}')
    upstream_json = response.json()

    if os.path.isfile(tool_versions_json_path):
        with open(tool_versions_json_path, 'r') as tool_versions_file:
            tool_versions_json = json.load(tool_versions_file)
    else:
        print("Couldn't find tool_versions.json, please run make setup")
        exit(1)

    # Compare the two JSON objects
    if upstream_json == tool_versions_json:
        print("The upstream JSON is the same as tool_versions.json")
    else:
        print("The upstream JSON is different from tool_versions.json, please update by running make setup")
        exit(1)


compare_json("./tool_versions.json")