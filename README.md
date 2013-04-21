PreProcess -- SCT rewrite (https://github.com/dymatic/custom-language-translator)
============
Welcome to the interim page for the PreProcess language translator.
The last bit of this program was thrown together due to some pretty harsh time constraints and it will be remedied in the forseable future. See the "Current Limitations" section to find out how this will effect your usage of the program. This is being rewritten in Haskell just for exercise using the language, and it will be my "baby" project as I strengthen my skills in it, so there will be some heavy code refactors as I learn the more powerful features of Haskell.

Limitations over SCT
====================
Language titles are not present, and I have decided that they will not be present.

Advantages over SCT
===================
Surprisingly, I goof'd in a very, very good way. I have a project called nAI that uses a config file with thing1|thing2_thing3$thing4 syntax. SCT always used thing1_thing2, which was very primitive. I thought when I was rewriting it that both used thing1|thing2, so now this version does too. Instead of having:
	say_cout
	shout_cout
you can have
	say|shout_cout

The parser is very forgiving. You can have weird text throughout the file on lines where you aren't going to do anything and it won't be added to any of the internal data structures. There is no code to back this up and it will cause an error if you do it too much, probably.

Features That will be implemented
=================================
	-Variant Configuation Files
	-Better Command-line option handling with a --overwrite flag.
	-.deb file

The Future
===========
Another plan I have is to implement changes from this repo into the SCT repo by calling Haskell functions from its C++ code, or just through a vanilla rewrite (or even through Guile Lisp). Users of the old SCT (I may be the only one, but if you use it, listen up) can "return home" after this project is EOL so that they won't need the massive Haskell libs.

I am also just learning Haskell, so I am going to go back and try to replace some of the guard functions with map cause for efficiency, and use Classes and what-not. This is my Haskell poster-child project, after all.

License
=========
This project is licensed under the BJLPL, or Black Joe Lesser Public License. If the license is TL;DR (It really shouldn't be; I'm not very verbose) it means that you have all the rights that the GPL gives you, but you can relicense under whatever. You can do anything with the code except make money from original copies (proxying) and name your derivitives Preprocess.