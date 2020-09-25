#!/usr/bin/env python3
import os
import subprocess
import sys


def Settings(**kwargs):
    # The absolute path of the file being edited.
    filename = kwargs["filename"]

    # The directory that the file being edited belongs to.
    directory = os.path.split(filename)[0]

    # Find the .tox directory of the project that `filename` belongs to.
    project_dir = directory
    tox_dir = None
    while True:
        if project_dir == "/":
            break
        if os.path.isfile(os.path.join(project_dir, "tox.ini")):
            tox_dir = os.path.join(project_dir, ".tox")
            break
        project_dir = os.path.split(project_dir)[0]

    if tox_dir:
        interpreter_path = os.path.join(tox_dir, "tests/bin/python")

        # Try to create the tox testenv if it doesn't exist.
        if not os.path.isfile(interpreter_path):
            try:
                subprocess.call(
                    [
                        os.path.expanduser("~/.pyenv/libexec/pyenv"),
                        "exec",
                        "tox",
                        "-c",
                        project_dir,
                        "-e",
                        "tests",
                        "--notest",
                    ],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                )
            except Exception:
                pass

        if os.path.isfile(interpreter_path):
            return {"interpreter_path": interpreter_path}

    return {}


if __name__ == "__main__":
    print(Settings(filename=os.path.abspath(sys.argv[1])))
