import click
import yaml


@click.command()
@click.argument('caravel_root', type=click.Path(exists=True))
@click.argument('pdk_root', type=click.Path(exists=True))
@click.argument('pdk')
@click.argument('user_project_root', type=click.Path(exists=True))
def update_design_info(caravel_root, pdk_root, pdk, user_project_root):
    data = {
        'CARAVEL_ROOT': caravel_root,
        'USER_PROJECT_ROOT': user_project_root,
        'PDK_ROOT': pdk_root,
        'PDK': pdk,
        'clk': 25,
        'caravan': False,
        'emailto': [None]
    }

    with open(f'{user_project_root}/verilog/dv/cocotb/design_info.yaml', 'w') as file:
        yaml.dump(data, file)


if __name__ == "__main__":
    update_design_info()

# paths = EnvironmentPaths("/home/rady/caravel/caravel_orginal/caravel/",
# "/home/rady/caravel/caravel_orginal/caravel_mgmt_soc_litex/",
# "/home/rady/caravel/files4vcs/pdk","sky130A",
# "/home/rady/caravel/swift/caravel_user_project/")

# WriteDesignInfo("/home/Marwan/caravel/swift/caravel-dynamic-sims/cocotb/",paths,Emailto=["mostafa.rady@efabless.com"])
