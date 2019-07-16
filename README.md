**Antilles** is a very lightweight static site generator in Perl/Mason. OK, fine, it's a single script that traverses a couple of directories: one to place your Mason templating components (these can be pure HTML if you wish), the other containing files that should not be processed. All HTML is then wrapped in a small amount of boilerplate, and a web root directory containing everything (preserving structure) is created.

### Quickstart
Clone this repository, change to the ```pages/``` directory, and start creating. There is no forced naming convention for your files, but keep in mind that their filenames will be used as-is in the generated site. Your server of choice may have strong opinions on how you name your files.

Running ```./antilles.pl``` will duplicate whatever heirarchy you create in the pages directory into a ```site/``` directory, except it'll all be real, live HTML.

Use the generated ```site/``` directory as your webroot, or copy its contents to your GitHub Pages repository (or wherever else!). 

Add CSS/JS/images and whatever non-template-processed things you have to the ```./resources``` directory. These will be copied over to the webroot (without 'resources' prepending). Add a ```./resources/style.css``` file before generating for the first time, if you wish. This file is already referred to by the top level template.

Antilles requires HTML::Mason. Use ```cpanm``` to get them and their dependencies.

### Advanced

The ```cfg.txt``` file allows you to create text variables (one per line) that are available in your pages. They are passed to every page by default. The one that's included here simply declares a "title" variable, which is used in the top-level autohandler to fill out the title element of every page. For more on using passed variables in Mason components, and using Mason in general, see [here](https://masonbook.houseabsolute.com/book/).
