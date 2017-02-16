***********
nanoscripts
***********

.. image:: figures/nanoscripts.png
   :align: center

Intro
-----
* *nanoscripts* is a set of small scripts that come in handy for (almost) every power user.
* Invoke any script with ``-h`` or ``--help`` option for a detailed info.

**Table of Contents**

.. contents:: `Table Of Contents`
    :depth: 2

Summary
-------

=================  =====================================================================  ================
**name**           **purpose**                                                            **dependencies**
lang               Create a new programming project.                                      python3
norm               Normalize file names.                                                  python3
suffix_remover     Remove relative link's {html,htm,php} suffix from passed web files.    BASH
today              Add a timestamp into file name(s).                                     python3
vid2aud            Extract audio track out of video file(s).                              python3, ffmpeg
win2utf            Transform file(s) with win-1250 encoding to UTF8.                      BASH
=================  =====================================================================  ================

Installation
------------

UNIX-like systems
+++++++++++++++++

* make sure you have ``python3`` installed
* put the scripts into ``~/bin`` or ``/opt/bin`` directory

.. code:: bash

  $ mkdir ~/bin
  $ cp -r lang lang-templates norm suffix_remover today vid2aud win2utf ~/bin
  
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

Normalize file name(s) by dealing with e.g. whitespace or diacritics.

* By default, interactive mode is turned on, so every filename change needs to be confirmed.
* ``-r`` or ``--recursive`` option allows recursive directory processing

synopsis
^^^^^^^^
``norm [OPTION] FILE1 [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  # example 1: normalize upper-case, diacritic and whitespace chars
  $ norm 'file WITH a really  bad name ' 'Résumé file'
  $ ls --quote-name
  "file.with.a.really.bad.name"  "resume.file"

.. code:: bash

  # example 2: disable diacritics removal and upper-case
  # to lower-case transformation
  $ norm --recursive -d -u 'Déjà vu file' 'dir/'

  # original file structure
  $ tree
  ├── Déjà vu file
  └── dir
      └── HELLO WORLD

  # normalized file structure
  $ tree
  ├── Déjà.vu.file
  └── dir
      └── HELLO.WORLD


suffix_remover
++++++++++++++

Remove all relative link's  {html,htm,php} suffix from passed web files ``FILE(s)`` or stdin.

With no FILE passed, stdin and stdout is used.
Note that if some FILE(s) are passed, in place processing is done.


synopsis
^^^^^^^^
``suffix_remover [FILE1] [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  $ cat file1
  <a href="http://www.example.com/index.php">link</a>
  <a href="article/hello-world.php">link</a>
  <a href="/">link</a><a href="index.php">link</a>
  <a href=/index.htm>link</a><a href=/home/index.html>link</a>

.. code:: bash

  $ suffix_remover file1

.. code:: bash

  $ cat file1
  <a href="http://www.example.com/index.php">link</a>
  <a href="article/hello-world">link</a>
  <a href="/">link</a><a href="/">link</a>
  <a href=/>link</a><a href=/home/>link</a>

Use case
^^^^^^^^
You're developing your web without an URL rewriting module (like ``Apache``'s ``mod_rewrite``)
and afterwards you will be uploading the web to a webserver with a URL rewriting module
(so that the files won't have html/htm/php suffix in an url).

This way you can use a classic relative web links (with a suffix) during development of your web
and before uploading just use this script to strip all {html,htm,php} suffixes.

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
  $ ls
  picture_[1970-01-01_09-00].jpg


vid2aud
+++++++
Extract audio track(s) from passed file(s).
The script interactively asks for artist and title metadata in a quick fashion
(are prefilled based on file's name).

* dependency: ``ffmpeg``

synopsis
^^^^^^^^
``vid2aud [OPTION] FILE1 [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  # supress metadata query, set output format to ogg vorbis
  $ vid2aud --no-metadata --format 'ogg' 'The.Four.Seasons.Spring.webm'
  $ ls
  The.Four.Seasons.Spring.ogg  The.Four.Seasons.Spring.webm


win2utf
+++++++

Transform file(s) with non-standard win-1250 encoding to UTF8.
The original file(s) get(s) backed up.

synopsis
^^^^^^^^
``win2utf FILE1 [FILE2 ...]``

example
^^^^^^^

.. code:: bash

  $ win2utf 'cz.srt' 'sk.srt' 'hu.srt' 'si.srt' 'ba.srt' 'hr.srt'
  $ ls
  cz.srt  cz.srt.old  sk.srt  sk.srt.old  hu.srt  hu.srt.old
  si.srt  si.srt.old  ba.srt  ba.srt.old  hr.srt  hr.srt.old
