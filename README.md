PreProcess -- SCT rewrite (https://github.com/dymatic/custom-language-translator)
============
Welcome to the interim page for the PreProcess language translator.
The last bit of this program was thrown together due to some pretty harsh time constraints and it will be remedied in the forseable future. See the "Current Limitations" section to find out how this will effect your usage of the program. This is being rewritten in Haskell just for exercise using the language, and it will be my "baby" project as I strengthen my skills in it, so there will be some heavy code refactors as I learn the more powerful features of Haskell.

Limitations over SCT
====================
Magichars ($) and Allow-characters (@) are not present at all, and neither are language titles. Magichars will be added (so that you can say f$or$ and have it come out as 'for'), and so will allow characters, but the changes may come slowly.

Advantages over SCT
===================
Surprisingly, I goof'd in a very, very good way. I have a project called nAI that uses a config file with thing1|thing2_thing3$thing4 syntax. SCT always used thing1_thing2, which was very primitive. I thought when I was rewriting it that both used thing1|thing2, so now this version does too. Instead of having:
	say_cout
	shout_cout
you can have
	say|shout_cout

Features That will be implemented
=================================
	-Magichars (code)
	-Allow Characters (langdefines)
	-Dot-Removes (langdefines) (etc .foofoofoo.say|shout_cout == say|shout_cout)
	-Titles
	-Variant Configuation Files
	-.deb file

The Future
===========
Another plan I have is to implement changes from this repo into the SCT repo by calling Haskell functions from its C++ code, or just through a vanilla rewrite (or even through Guile Lisp). Users of the old SCT (I may be the only one, but if you use it, listen up) can "return home" after this project is EOL so that they won't need the massive Haskell libs.

License
=========
This project is tentatively licensed under the MIT license, but when I get around to rewriting the BJLPL (Black-Joe Lesser Public License) it will be relicensed under that. I wrote the BJLPL myself and truly do prefer it over other open source licenses. Basically the BJPL states that anyone is free to edit the source code (which is forcibly relinquished) and to distribute their own copies, but not the make money from the original product or retain the original product's name.
