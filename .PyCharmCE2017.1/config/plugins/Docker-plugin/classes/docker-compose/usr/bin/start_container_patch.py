import os
import sys

from compose.container import Container

JETBRAINS_ASK_IDE_TO_START_CONTAINERS = 'JETBRAINS_ASK_IDE_TO_START_CONTAINERS'


def new_container_start(self):
    """
    Replaces Container.start() function to let IDE take control over starting service containers.

    If the environment variable JETBRAINS_ASK_IDE_TO_START_CONTAINERS is set then docker-compose will wait for an input from IDE after
    a container has been started.
    If JETBRAINS_ASK_IDE_TO_START_CONTAINERS is not set then docker-compose just ignores requests to start containers. IDE will find out
    which containers should be started from the docker-compose output.
    """
    if os.environ.get(JETBRAINS_ASK_IDE_TO_START_CONTAINERS):
        sys.stdout.write('$docker start ' + str(self.name) + '\n')
        sys.stdout.flush()
        raw_input()


Container.start = new_container_start
