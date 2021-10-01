#!/usr/bin/env python3
import click

# Top level group
@click.group()
def cli():
    pass

# Group for ships related commands
@click.group(help='Ship related commands')
def ships():
    pass

# Adds ships group as a top-level command
cli.add_command(ships)

# Add command to ships group
@ships.command(help='Sail a ship')
def sail():
    ship_name = 'Your ship'
    print(f"{ship_name} is setting sail")

@ships.command(help='List all of the ships')
def list_ships():
    ships = ['John B', 'Yankee Clipper', 'Pequod']
    print(f"Ships: {','.join(ships)}")

# Add commands to cli (top-level) group
@cli.command(help='Talk to a sailor')
@click.option('--greeting', default='Ahoy there', help='Greeting for sailor')
@click.argument('name')
def sailors(greeting, name):
    message = f'{greeting} {name}'
    print(message)

if __name__ == '__main__':
    # Call top-level group
    cli()
