**Antilles** is a very lightweight static site generator in Perl/Mason. OK, fine, it's a Markdown processor that traverses a directory and wraps the resulting HTML snippets in a small amount of boilerplate.

### Quickstart
Clone this repository, change to the ```pages/``` directory, and start creating. There is no forced naming convention for your Markdown files, but keep in mind that their filenames will be used as-is in the generated site. Your server of choice may have strong opinions on how you name your files.

Running ```./generate.pl``` will duplicate whatever heirarchy you create in the markdown directory into a ```site/``` directory, except it'll all be real, live HTML.

Use the generated ```site/``` directory as your webroot, or copy its contents to your GitHub Pages repository (or wherever else!). 

Add a ```style.css``` file to the webroot if you wish; this file is already referred to by the ```autohandler``` template.

Antilles requires HTML::Mason and Text::Markdown. Use ```cpanm``` to get them and their dependencies.

### Advanced

Your Markdown files need not be purely Markdown! They are processed first as Mason components, so you're free to write Perl in your pages as well, as well as do other neat things like calling other pages. Mason use is beyond the scope of this README, however. 

The ```cfg.txt``` file allows you to create text variables (one per line) that are available in your pages. They are passed to every page by default. The one that's included here simply declares a "title" variable, which is used in the top-level autohandler to fill out the title element of every page. For more on using passed variables in Mason components, and using Mason in general, see [here](https://masonbook.houseabsolute.com/book/).




