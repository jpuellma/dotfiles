import __builtin__
import os


class FileWrapper(object):
    """Wraps file object to workaround VirtualBox shared folders bug

    https://www.virtualbox.org/ticket/9069
    """

    def __init__(self, obj):
        self._wrapped_obj = obj

    def __getattr__(self, attr):
        if attr in self.__dict__:
            return getattr(self, attr)
        return getattr(self._wrapped_obj, attr)

    def __enter__(self):
        """__enter__ and __exit__ functions should be made explicit otherwise "with" statement doesn't see them"""
        self._wrapped_obj.__enter__()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """__enter__ and __exit__ functions should be made explicit otherwise "with" statement doesn't see them"""
        return self._wrapped_obj.__exit__(exc_type, exc_val, exc_tb)

    def read(self, size=-1):
        """Overrides standard read() function of Python built-in file types

        Python 2.7 uses readv(2) system call to fill byte buffers for files. This call seems to have unexpected
        behaviour when reading files from VirtualBox shared folders: a content of the file read may not be up-to-date.
        Use of read(2) system call fixes the problem.

        See https://github.com/joyent/libuv/pull/1220
        """
        if size < 0:
            result = ''
            continue_reading = True
            while continue_reading:
                chunk_read = os.read(self.fileno(), 1024)
                result += chunk_read
                continue_reading = chunk_read != ''
            return result
        else:
            return os.read(self.fileno(), size)


original_open = __builtin__.open


def new_open(name, mode='r', buffering=-1):
    original_file = original_open(name, mode, buffering)
    wrapped_file = FileWrapper(original_file)
    return wrapped_file


__builtin__.open = new_open
