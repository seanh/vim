import os
import subprocess


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
        # Create the tox testenv.
        subprocess.call(["tox", "-c", project_dir, "--notest"])
        return {"interpreter_path": os.path.join(tox_dir, "tests/bin/python")}

    return {}
