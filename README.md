# arduino HTTP lib test

This app expects HTTP requests with test data to come
from the [arduino HTTP lib sketch](://github.com/csquared/arduino-http#full-example).

It returns 200 OK when a test succeeds if the request contains
the right data and a 420 FAIL if not.
