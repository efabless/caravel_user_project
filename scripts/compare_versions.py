# SPDX-FileCopyrightText: 2023 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
import os
import requests
import json


def compare_json(tool_versions_json_path):
    try:
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
    except requests.exceptions.RequestException as e:
        print("An error occurred while fetching data")
        print("Please check your internet connection.")
        exit(1)


compare_json("./tool_versions.json")