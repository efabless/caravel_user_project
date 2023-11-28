import argparse
import json
import os
import shutil
import subprocess
import tarfile
import requests
import volare
from rich.progress import (
    Progress,
    TextColumn,
    BarColumn,
    MofNCompleteColumn,
    TimeElapsedColumn,
)


def parse_json_file(url):
    """Parses a JSON file from the given URL.

    Args:
    url: The URL of the JSON file.

    Returns:
    A Python dictionary containing the parsed JSON data.
    """

    response = requests.get(url)
    if response.status_code != 200:
        raise ValueError(f'Failed to get JSON data from {url}: {response.status_code}')

    data = response.json()
    json_data = json.dumps(data, indent=4)
    # Write the JSON data to a file
    with open('tool_versions.json', 'w') as file:
        file.write(json_data)
    return data


def download_tools(openlane_root, precheck_root, pdk_root, caravel_root, mcw_root, timing_root):
    """Downloads the tools from the upstream GitHub repo.
    """
    url = 'https://raw.githubusercontent.com/efabless/central_CI/main/tools.json'
    data = parse_json_file(url)
    f = open("setup.log", "a")
    with Progress(TextColumn("[progress.description]{task.description}"), BarColumn(), MofNCompleteColumn(), TimeElapsedColumn()) as progress:
        task = progress.add_task("[cyan]Downloading Tools...", total=6)
        for key, value in data.items():
            if key == "OpenLane":
                progress.update(task, description="[cyan]Downloading OpenLane...")
                download_tar("OpenLane", value['commit'], value['url'], openlane_root)
                progress.update(task, description="[cyan]Downloading OpenLane Docker...")
                os.environ['OPENLANE_IMAGE_NAME'] = f"efabless/openlane:{value['commit']}"
                os.environ['IMAGE_NAME'] = f"efabless/openlane:{value['commit']}"
                subprocess.run(["make", "pull-openlane"], cwd=openlane_root, env=os.environ, stderr=subprocess.STDOUT, text=True, check=True, stdout=f)
                print("OpenLane downloaded successfully")
                progress.update(task, advance=1)
            elif key == "pdk":
                progress.update(task, description="[cyan]Downloading pdk...")
                progress.stop()
                volare.enable(pdk_root, "sky130", value['commit'])
                progress.start()
                progress.update(task, advance=1)
            elif key == "precheck":
                progress.update(task, description="[cyan]Downloading mpw_precheck...")
                download_tar("precheck", value['commit'], value['url'], precheck_root)
                print("mpw_precheck downloaded successfully")
                progress.update(task, advance=1)
            elif key == "caravel":
                progress.update(task, description="[cyan]Downloading caravel...")
                download_tar("caravel", value['commit'], value['url'], caravel_root)
                print("caravel downloaded successfully")
                progress.update(task, advance=1)
            elif key == "mgmt_core_wrapper":
                progress.update(task, description="[cyan]Downloading mgmt_core_wrapper...")
                download_tar("mgmt_core_wrapper", value['commit'], value['url'], mcw_root)
                print("mgmt_core_wrapper downloaded successfully")
                progress.update(task, advance=1)
            elif key == "timing_scripts":
                progress.update(task, description="[cyan]Downloading timing_scripts...")
                download_tar("timing_scripts", value['commit'], value['url'], timing_root)
                print("timing_scripts downloaded successfully")
                progress.update(task, advance=1)


def download_tar(tool, version, url, tool_path):
    if os.path.isdir(tool_path):
        shutil.rmtree(tool_path)
    os.makedirs(tool_path)
    name = url.split("/")[-1]
    owner = url.split("/")[-2]
    # print(f"downloading {tool}")
    response = requests.get(f'{url}/tarball/{version}')
    if response.status_code != 200:
        raise Exception(f"Failed to download {tool}")
    with open(f'{os.path.dirname(tool_path)}/{version}.tar.gz', 'wb') as file:
        file.write(response.content)
    # print(f"extracting {os.path.dirname(tool_path)}/{version}.tar.gz")

    tar = tarfile.open(f'{os.path.dirname(tool_path)}/{version}.tar.gz', 'r:gz')
    tar.extractall(path=os.path.dirname(tool_path))
    tar.close()
    os.rename(f'{os.path.dirname(tool_path)}/{owner}-{name}-{version[0:7]}', f'{tool_path}')
    os.remove(f'{os.path.dirname(tool_path)}/{version}.tar.gz')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--openlane_root', required=True,
                        help='Path to the OpenLANE root directory')
    parser.add_argument('--precheck_root', required=True,
                        help='Path to the Precheck root directory')
    parser.add_argument('--pdk_root', required=True,
                        help='Path to the PDK root directory')
    parser.add_argument('--caravel_root', required=True,
                        help='Path to the Caravel root directory')
    parser.add_argument('--mcw_root', required=True,
                        help='Path to the Mgmt Core Wrapper root directory')
    parser.add_argument('--timing_root', required=True,
                        help='Path to the Timing Scripts root directory')

    args = parser.parse_args()
    download_tools(openlane_root=args.openlane_root,
                   precheck_root=args.precheck_root,
                   pdk_root=args.pdk_root,
                   caravel_root=args.caravel_root,
                   mcw_root=args.mcw_root,
                   timing_root=args.timing_root)


if __name__ == '__main__':
    main()
