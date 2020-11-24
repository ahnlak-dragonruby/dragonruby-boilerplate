# DragonRuby Boilerplate

This template project is designed to make it easy to get up and running with
your DragonRuby-based project.

To use, simply [create your new project](https://github.com/ahnlak-dragonruby/dragonruby-boilerplate/generate)
using this template, and then:

* use the provided `copy-dr.sh`(Linux) or `copy-dr.bat`(Windows) script to copy
  the relavent DragonRuby files into your main project folder.

* add your code and resources to the folders in `mygame`

* run and test your project by running `dragonruby(.exe)` from your main project
  folder

* package and upload your project by running `dragonruby-publish(.exe)` from your
  main project folder.


## copy-dr

The `copy-dr` script takes the folder name of your main DragonRuby installation
as an argument; it will copy the appropriate files and folders into the current
working folder (so, run it from your main project folder).

The copied files are included in the provided `.gitignore` file, so they will not
be added into your github repository.

If you keep copies of previous and current versions of the DragonRuby folder,
then you can easily use the `copy-dr` script to switch to newer (or older!)
versions of DragonRuby within each of your projects.

For example, I use the following folder structure:

`
/home/ahnlak
|---Development
    |---dragonruby-1.25
    |---dragonruby-1.26
    |---dragonruby-1.27
    |---my_super_dooper_game
        |---mygame
        |---....
`

From `my_super_dooper_game`, I can then run `copy-dr.sh ../dragonruby-1.27` to
install the latest DragonRuby, or `copy-dr.sh ../dragonruby-1.25` to regress to
a previous version.
