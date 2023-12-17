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

import argparse
import json


def print_commit(tool_name):
    with open('tool_versions.json', 'r') as file:
        tool_versions_json = json.load(file)

    if tool_name in tool_versions_json:
        commit = tool_versions_json[tool_name]['commit']
        print(commit)
    else:
        print("Invalid tool name")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('tool_name', help='Name of the tool to print the commit for')
    args = parser.parse_args()

    print_commit(args.tool_name)


if __name__ == '__main__':
    main()
