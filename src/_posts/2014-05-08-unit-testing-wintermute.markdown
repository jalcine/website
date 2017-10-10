---
layout: post
title: Unit Testing Wintermute
date: 2014-05-08 23:24:06 EDT
excerpt: |
  Some thoughts on handling Wintermute and unit testing.
category: wintermute
tags:
  - wintermute
  - testing
  - development
---

While I've been working on [Wintermute][] in my free time, I noticed that
adding new features or just improving code became more of a gamble than
a logical, practical coding pattern. I'm also trying to hit a version 0.1.0 by
the 16th of June this year so by reducing the margin of improbability and
error, it'll be not only easier to build but make me more willingly of me to
advertise this project to other people. What I ended up doing was using
[QtTest][] and [CMake's test driver][ctest] to handle all of the tests just by
running a simple command.

## Enabling CMake's Test Driver

Using CMake's test driver, [CTest][ctest], isn't too difficult. It requires the
inclusion of a file and a few macro calls. The CTest Wiki [tells you how to do
it][ctest_use] so I won't go into detail here. What I _will_ do is mention how
I managed to make the process a bit easier. I have to note, the most annoying
thing so far about CTest is that for the most decent test, you have to call
`enable_testing()` from the root `CMakeLists.txt`. Completely annoying but a
gimmick that's unavoidable for now. Right now, Wintermute's
`test/unit/CMakeLists.txt` looks like the following sans the licensing:

{% highlight cmake linenos %}
wintermute_test_render ( TARGET arguments SOURCES arguments.cpp )
wintermute_test_render ( TARGET event_filter SOURCES Events/message_filter.cpp )
wintermute_test_render ( TARGET event_message SOURCES Events/message.cpp )
wintermute_test_render ( TARGET factory SOURCES factory.cpp )
wintermute_test_render ( TARGET logging SOURCES logging.cpp )
wintermute_test_render ( TARGET plugin SOURCES plugin.cpp )
wintermute_test_render ( TARGET plugin_process SOURCES plugin_process.cpp )
wintermute_test_render ( TARGET procedure_call SOURCES Procedure/call.cpp )
wintermute_test_render ( TARGET procedure_dispatcher SOURCES Procedure/dispatcher.cpp )
wintermute_test_render ( TARGET procedure_lambda_call SOURCES Procedure/module_call.cpp )
wintermute_test_render ( TARGET procedure_message SOURCES Procedure/message.cpp )
wintermute_test_render ( TARGET procedure_method_call SOURCES Procedure/method_call.cpp )
wintermute_test_render ( TARGET procedure_module SOURCES Procedure/module.cpp )
wintermute_test_render ( TARGET procedure_module_call SOURCES Procedure/module_call.cpp )
wintermute_test_render ( TARGET procedure_module_def SOURCES Procedure/module_def.cpp )
wintermute_test_render ( TARGET procedure_receiver SOURCES Procedure/receiver.cpp )
wintermute_test_render ( TARGET procedure_reply_call SOURCES Procedure/reply_call.cpp )
wintermute_test_render ( TARGET version SOURCES version.cpp )
{% endhighlight %}

Initially, I thought about making it use a `glob`ing method and pick up all of
the source code under `test/unit` but CMake doesn't detect changes to the file
system unless you specifically invoke `make rebuild_cache` or touch the
last-modified time of one of the `CMakeLists.txt` files so manually adding the
tests to the lists was required. For now, it's not so bad since I can see at a
glance which tests are available without having to run the suite.

## Defining the Wrapping Macro

To make the process of defining libraries, compile flags, include directories
and all that jazz *n times easier* for me, I wrote the following to automate
that process each time I called the method. The logic for the
`wintermute_test_render(TARGET SOURCES)` macro I used is as follows:

{% highlight cmake linenos %}
macro(wintermute_test_render)
  set(_singleArgs )
  set(_oneArgs   TARGET)
  set(_multiArgs SOURCES)
  cmake_parse_arguments(wtr "${_singleArgs}" "${_oneArgs}" "${_multiArgs}"
    ${ARGN})

  set(_test_name "${wtr_TARGET}")
  set(_test_tgt "${_test_name}-test")

  add_executable(${_test_tgt} ${wtr_SOURCES})
  wintermute_add_properties(${_test_tgt})
  target_link_libraries(${_test_tgt} wintermute-test-library)

  add_test(NAME "${_test_name}-driver"
    COMMAND $<TARGET_FILE_DIR:${_test_tgt}>/$<TARGET_FILE_NAME:${_test_tgt}>
            ${WINTERMUTE_TEST_ARGUMENTS})
endmacro()
{% endhighlight %}

It's a bit shorthand willy-nilly but in short, it takes multiple values for
sources (`SOURCES`) with the named `TARGET`, links the static library
`wintermute-test-library` which is just a cannibalized version of the
`wintermute` binary and sets it up as if it was the `wintermute` executable.
For now, that works well enough to provide an equivalent state of what the test
would run in. I envied the ease of testing of stuff in dynamic languages like
Ruby or JavaScript; this is as close as I could get.

## Running the Tests

Thanks to CTest, a `test` target is defined that takes all of the tests I've
defined above and made it easier to one-click (or command) to test every
target. When I run my suite for tests a là `make test`; I get the following
as output:

{% highlight bash linenos %}
application feature/build-unit-tests/4f3bdc4 $ make -C build test
make: Entering directory `/home/jacky/Development/Projects/Wintermute/application/build'
Running tests...
/usr/bin/ctest --force-new-ctest-process
Test project /home/jacky/Development/Projects/Wintermute/application/build
      Start  1: version-driver
 1/18 Test  #1: version-driver ...................   Passed    0.44 sec
      Start  2: arguments-driver
 2/18 Test  #2: arguments-driver .................   Passed    2.36 sec
      Start  3: plugin-driver
 3/18 Test  #3: plugin-driver ....................   Passed    0.09 sec
      Start  4: plugin_process-driver
 4/18 Test  #4: plugin_process-driver ............   Passed    0.12 sec
      Start  5: factory-driver
 5/18 Test  #5: factory-driver ...................   Passed    0.15 sec
      Start  6: logging-driver
 6/18 Test  #6: logging-driver ...................   Passed    0.10 sec
      Start  7: procedure_message-driver
 7/18 Test  #7: procedure_message-driver .........   Passed    1.52 sec
      Start  8: procedure_call-driver
 8/18 Test  #8: procedure_call-driver ............***Exception: SegFault  0.38 sec
      Start  9: procedure_method_call-driver
 9/18 Test  #9: procedure_method_call-driver .....   Passed    0.15 sec
      Start 10: procedure_reply_call-driver
10/18 Test #10: procedure_reply_call-driver ......***Exception: SegFault  0.24 sec
      Start 11: procedure_module_call-driver
11/18 Test #11: procedure_module_call-driver .....   Passed    0.09 sec
      Start 12: procedure_lambda_call-driver
12/18 Test #12: procedure_lambda_call-driver .....   Passed    0.12 sec
      Start 13: procedure_module_def-driver
13/18 Test #13: procedure_module_def-driver ......   Passed    0.11 sec
      Start 14: procedure_module-driver
14/18 Test #14: procedure_module-driver ..........   Passed    0.11 sec
      Start 15: procedure_dispatcher-driver
15/18 Test #15: procedure_dispatcher-driver ......   Passed    0.11 sec
      Start 16: procedure_receiver-driver
16/18 Test #16: procedure_receiver-driver ........   Passed    0.11 sec
      Start 17: event_message-driver
17/18 Test #17: event_message-driver .............   Passed    0.10 sec
      Start 18: event_filter-driver
18/18 Test #18: event_filter-driver ..............   Passed    0.13 sec

89% tests passed, 2 tests failed out of 18

Total Test time (real) =   6.50 sec

The following tests FAILED:
    8 - procedure_call-driver (SEGFAULT)
   10 - procedure_reply_call-driver (SEGFAULT)
make: Leaving directory `/home/jacky/Development/Projects/Wintermute/application/build'
{% endhighlight %}

This is actually so perfect for me when I'm working with Wintermute. If I
forget to define a method within the binary but I never happen to call it, I
can catch its failure immediately and work to define that method. Since I began
testing *after* the fact, I'm catching bugs, subtle issues and a lot of feature
creep between classes. At the same time, I've managed to get Wintermute working
more sensibly and dropped lines of code whenever deemed necessary. If you were
to pull from develop (or ever check the Travis.CI build, not sure if I fixed
it), you'd see that it's failing. I'm glad it is for now, but I'm working to
make a more testable, sane and potential awesome 0.1.0 release of Wintermute.

[Wintermute]: http://wintermute.jalcine.me
[QtTest]: http://qt-project.org/doc/qt-4.8/qttest.html
[ctest]: http://www.cmake.org/cmake/help/v2.8.8/ctest.html 
[ctest_use]: http://www.vtk.org/Wiki/CMake/Testing_With_CTest
