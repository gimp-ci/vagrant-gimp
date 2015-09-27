# Objectives for this project

* Development is to be based off of the latest GIMP `master` branch.
* Create JavaScript bindings to libgimp so that GIMP plugins can be
  written in JavaScript.  This is based off of [2011 Idea support writing
  JavaScript plugins][jsbind-idea].
* Programming GIMP plugins in JavaScript should be idiomatic to the JavaScript
  language.

# Technical recommendations

* Create bindings for GIMP (Gjs and libgimp).
* Create bindings for GEGL for pixel manipulation (Gjs).
* Create bindings for Gtk+ dialogs (GObject Introspection and Gjs).

# First steps

When building GIMP from the `master` branch one needs to also compile the
latest master of the dependencies GEGL and BABL.  All other dependencies
can be installed with prefered versions.  See [documentation on
building GIMP from source][buildgimp].

* Use [vagrant-gimp](../README.md) as your development environment.
* Clone GIMP: `git://git.gnome.org/gimp`
* Clone BABL: `git://git.gnome.org/babl`
* Clone GEGL: `git://git.gnome.org/gegl`


[buildgimp]: http://www.gimp.org/source/
[gobject]: https://wiki.gnome.org/Projects/GObjectIntrospection
[jsbind-idea]: http://wiki.gimp.org/wiki/Hacking:GSoC/2011/Ideas#Support_writing_JavaScript_plug-ins
[jslibs]: https://wiki.gnome.org/JavaScript
[lg-gimp]: http://developer.gimp.org/api/2.0/libgimp/libgimp-Gimp.html
[lg-gimpplugin]: http://developer.gimp.org/api/2.0/libgimp/libgimp-gimpplugin.html
[perlbind]: https://metacpan.org/release/Gimp
[vagrant]: https://www.vagrantup.com/
