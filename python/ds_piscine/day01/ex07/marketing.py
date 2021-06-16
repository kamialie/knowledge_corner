#!/usr/local/bin/python3

import sys

def execute(command):
    clients = ['andrew@gmail.com', 'jessica@gmail.com', 'ted@mosby.com',
            'john@snow.is', 'bill_gates@live.com', 'mark@facebook.com',
            'elon@paypal.com', 'jessica@gmail.com']
    participants = ['walter@heisenberg.com', 'vasily@mail.ru',
            'pinkman@yo.org', 'jessica@gmail.com', 'elon@paypal.com',
            'pinkman@yo.org', 'mr@robot.gov', 'eleven@yahoo.com']
    recipients = ['andrew@gmail.com', 'jessica@gmail.com', 'john@snow.is']

    commands = {
        "call_center": print_call_center_list,
        "potential_clients": print_potential_clients_list,
        "loyalty_program": print_loyalti_program_list
    }

    if command in commands:
        commands[command](clients, participants, recipients)
    else:
        raise ValueError("Unknown command")

def print_call_center_list(clients, participants, recipients):
    print(list(set(clients) | set(participants) - set(recipients)))

def print_potential_clients_list(clients, participants, recipients):
    print(list(set(participants) - set(clients)))

def print_loyalti_program_list(clients, participants, recipients):
    print(list(set(clients) - set(participants)))

if __name__ == "__main__":
    if len(sys.argv) == 2:
        execute(sys.argv[1])
