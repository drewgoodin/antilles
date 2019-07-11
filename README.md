**Antilles** is a very lightweight static, flat-file site generator in Perl/Mason. It allows you to write your pages entirely in Markdown.

###Quickstart
Clone this repository, change to the ```./pages/markdown``` directory, and start creating. There is no forced naming convention for your Markdown files, but keep in mind that their filenames will be used as-is in the generated site. Your server of choice may have strong opinions on how you name your files.

Running ```./generate.pl``` will duplicate whatever heirarchy you create in the markdown directory into the ```site``` directory, except it'll all be real, live HTML.

Use the ```site``` directory as your webroot, or copy its contents to your GitHub Pages repository (or wherever else!).

Antilles requires HTML::Mason. Use ```cpanm``` to get it and its dependencies.

###Advanced

Your Markdown files need not be purely Markdown! They are processed first as Mason components, so you're free to write Perl in your pages as well, as well as do other neat things like calling other pages. Mason use is beyond the scope of this README, however. 

The ```cfg.txt``` file allows you to create text variables (one per line) that are available in your pages. They are passed to every page by default. The one that's included here simply declares a "title" variable, which is used in the top-level autohandler to fill out the title element of every page. For more on using passed variables in Mason components, and using Mason in general, see [here](https://masonbook.houseabsolute.com/book/).




