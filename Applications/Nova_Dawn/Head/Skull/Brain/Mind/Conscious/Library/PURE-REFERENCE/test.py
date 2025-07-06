# === OmniCode Test File ===
# Purpose: Test ChatGPT's ability to simulate Python code from simple to complex.
# Principle: Overcomment EVERYTHING so even non-programmers can follow easily.

# -----------------------------------------
# Level 1: Simple Function Return
# (This should easily simulate inside ChatGPT)
# -----------------------------------------

def simple_greet(name):
    """
    Receives a name and returns a simple greeting message.
    """
    return f"Hello, {name}!"

# Example simulation:
# print(simple_greet("Seanje"))
# Expected Output: "Hello, Seanje!"

# -----------------------------------------
# Level 2: Conditional Branching
# (Simple decision-making; still simulation-friendly)
# -----------------------------------------

def check_access(age):
    """
    Checks if a user is eligible for access based on age.
    """
    if age >= 18:
        return "Access granted."
    else:
        return "Access denied."

# Example simulation:
# print(check_access(21))
# Expected Output: "Access granted."

# -----------------------------------------
# Level 3: Looping Structures
# (Introduce loops; light simulation still possible)
# -----------------------------------------

def count_to_number(n):
    """
    Counts from 1 up to n and returns a list of numbers.
    """
    numbers = []
    for i in range(1, n + 1):
        numbers.append(i)
    return numbers

# Example simulation:
# print(count_to_number(5))
# Expected Output: [1, 2, 3, 4, 5]

# -----------------------------------------
# Level 4: Object-Oriented Structures
# (Simulation getting heavier; classes and states)
# -----------------------------------------

class UserProfile:
    """
    Represents a basic user profile with login simulation.
    """
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def check_login(self, input_username, input_password):
        """
        Verifies if login credentials match.
        """
        return self.username == input_username and self.password == input_password

# Example simulation:
# user = UserProfile("Nova", "Kingdom123")
# print(user.check_login("Nova", "Kingdom123"))
# Expected Output: True

# -----------------------------------------
# Level 5: Simulated Timer / Thread (Limited inside ChatGPT)
# (Starting to reach boundaries; may only describe behavior)
# -----------------------------------------

import time
import threading

def delayed_message(message, delay):
    """
    Waits for 'delay' seconds, then prints a message.
    (In real execution, time.sleep would actually delay.)
    """
    time.sleep(delay)
    print(message)

def start_delayed_task():
    """
    Starts a delayed task in a separate thread.
    """
    t = threading.Thread(target=delayed_message, args=("This is delayed.", 5))
    t.start()

# Simulation Limitation:
# ChatGPT can describe what would happen but cannot really run threads or timers properly.

# Example (not runnable here):
# start_delayed_task()
# Expected Behavior: After 5 seconds, "This is delayed." prints.

# -----------------------------------------
# Level 6: File I/O Simulation
# (Beyond ChatGPT's native abilities unless manually faked)
# -----------------------------------------

def write_to_file_simulation(filename, content):
    """
    Simulates writing content to a file.
    (Real file I/O would require environment execution.)
    """
    fake_file = {
        "filename": filename,
        "content": content
    }
    return fake_file

# Example simulation:
# print(write_to_file_simulation("notes.txt", "Hello world"))
# Expected Output: {'filename': 'notes.txt', 'content': 'Hello world'}

# -----------------------------------------
# Summary:
# Levels 1-4 → Fully simulatable in ChatGPT.
# Levels 5-6 → Simulation possible but requires descriptive behavior (no real execution).

# This file can be expanded later into a "Scaffold Test File" to build OmniCode operational rules.

# === End of Test File ===
