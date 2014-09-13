***********
nanoscripts
***********

Intro
-----
* *nanoscripts* is a set of small scripts that come in handy for (almost) every power user.
* Invoke the script with ``-h`` or ``--help`` option for detailed info.

**Table of Contents**

.. contents:: `Table Of Contents`
    :depth: 2

Summary
-------

=============  =========================================  =================
**name**       **purpose**                                **language**
lang           Create a new programming project.          python3
norm           Normalize file names.                      python3
today          Add a timestamp into file name(s).         python3
vid2aud        Extract audio track out of video file(s).  python3
=============  =========================================  =================

Installation
------------

UNIX-like systems
+++++++++++++++++

* make sure you have ``python3`` installed
* put the scripts into ``~/bin`` or ``/opt/bin`` directory

.. code:: bash

  $ mkdir ~/bin
  $ cp lang lang-templates norm today vid2aud win2utf ~/bin
  
* add ``~bin/`` to the ``PATH`` variable (in the ``.bashrc`` file)

Scripts
-------

lang
++++
Prepare a new directory ``DIR`` for a specified programming language ``LANG``.

synopsis
^^^^^^^^
``lang [OPTION] LANG DIR``

example
^^^^^^^

.. code:: bash

  # list all available languages
  $ lang --list
  'bash' for: BASH
  'c' for: C
  'cpp' for: C++
  'java' for: Java
  'pl' for: Perl
  'py' for: Python
  'rb' for: Ruby

.. code:: bash

  # create a new C++ project
  $ lang C++ ~/Desktop/new_cpp_project

  $ ls ~/Desktop/new_cpp_project
  main.cpp  Makefile

norm
++++

Normalize file name(s) by dealing e.g. with whitespace or diacritics.
By default, interactive mode is on, so every filename change needs to be confirmed.

synopsis
^^^^^^^^
``norm [OPTION] FILE1 [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  # remove upper-case, diacritics and all whitespace characters including a trailing ones
  $ norm 'file WITH a really  bad naming ' 'Résumé file'
  $ ls
  file.with.a.really.bad.naming  resume.file

.. code:: bash

  $ tree
  ├── Déjà vu file
  └── dir
      └── HELLO WORLD

  # disable diacritics removal and upper-case to lower-case transformation
  $ norm --recursive -d -u 'Déjà vu file' 'dir/'
  ├── Déjà.vu.file
  └── dir
      └── HELLO.WORLD

today
+++++

Add a timestamp into the file name(s).

synopsis
^^^^^^^^
``today [OPTION] FILE1 [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  $ today 'file1' 'file2.odt'
  $ ls
  file1_[1970-01-01]  file2_[1970-01-01].odt

.. code:: bash

  $ today --time 'picture.jpg'
  picture_[1970-01-01-09_00].jpg


vid2aud
+++++++
Extract audio track(s) from passed file(s).
The scripts interactively asks for artist and title metadata in a quick fashion
(are prefilled based on file's name).

* dependency: ``ffmpeg``

synopsis
^^^^^^^^
``lang [OPTION] LANG DIR``

example
^^^^^^^

.. code:: bash

  # supress metadata query
  $ vid2aud --no-metadata 'Antonio.Vivaldi-The.Four.Seasons.Spring.webm'
  $ ls
  Antonio.Vivaldi-The.Four.Seasons.Spring.webm  Antonio.Vivaldi-The.Four.Seasons.Spring.ogg
