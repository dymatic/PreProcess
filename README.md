PreProcess -- SCT rewrite (https://github.com/dymatic/custom-language-translator)
============
Welcome to the page for the humble SCT rewrite, implemented in Haskell. Originally this was a proof-of-concept implementation for applying LibHaskell, but it has grown into a project of its own. This will DEPRECATE SCT when it is feature-complete (with Noran Makefiles and a changable langdefines file).

Limitations over SCT
====================
Language titles are not present, and I have decided that they will not be present.

Advantages over SCT
===================
You can have multiple lvals on one line with the '|' token.
	say|yell_cout
is the same as writing
	say_cout
	yell_cout
in the old SCT. Old SCT files can still be read, but this provides a MUCH shorter way of using multiple lvals with one rval.

Features That will be implemented
=================================
	-Better Command-line option handling with a --overwrite flag.

The Future
===========
I am new to Haskell yet and will eventually rewrite a good portion of the code making up this program (probably using my own data structures, since that was one area I was lacking in at the time of writing).

There is also a boot system in-development

License
=========
This project is licensed under the BJLPL, or Black Joe Lesser Public License. If the license is TL;DR (It really shouldn't be; I'm not very verbose) it means that you have all the rights that the GPL gives you, but you can relicense under whatever. You can do anything with the code except make money from original copies (proxying) and name your derivitives Preprocess.
