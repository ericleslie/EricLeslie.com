---
title: Launching My New Website
tags: ['Web Development']
date: 2013-4-16
keywords: web development
description: What goes into launching a new website
author: Eric Leslie
email: eric@ericleslie.com
layout: post
post: true
---

I was in this same place about a year ago when I launched a totally new website that was a combo Wordpress and custom made site all developed under a design that I purchased from ThemeForest.com. One of my biggest goals was to build my portfolio to work much like Flickr. It had to have this idea of a stream of photos that could be searched or organized by tag rather than into albums. I also wanted it to be heavily SEO optimized. I accomplished all of that and grew my traffic up to about 200 visits per day.

![Sublime Text Editor](http://www.lesliephotos.com/photos/i-kdqghk9/0/L/i-kdqghk9-L.jpg)

###So why change all of that? 
Well, I didn't. It's more like I've iterated towards something faster and leaner. About a month ago I stumbled onto a blog post geeking out about some new technology called node.js. It's basically an http server built on Google Chrome's Javascript engine V8. So all the server-side code is written in Javascript. Without getting into it too deeply, Node.js is **fast** compared to a traditional Apache webserver. 

After making a few "Hello World" applications, I looked on for a framework or CMS that I could use to rapidly build a website. I found [Docpad](http://docpad.org). It's genius lies in it's ability to write your website with any markup language you want and it will generate a static site for you. So the pages aren't generated from a database on the fly for every page load. Static sites like a blog don't really need a database at all. I had to completely re-wire my brain because I was brainwashed into thinking my website *had* to be database driven.

The last piece of the puzzle was the actual design of my website. Design is my weak point and I can't afford to hire a designer. Sifting through template sites is very unsatisfying because they are never 100% what I'm looking for. In steps the Twitter CSS framework, [Bootstrap](http://twitter.github.io/bootstrap/index.html). It's basically a set of pre-configured styles with a simple scaffolding system for effortless layouts. It makes building a nice website fast and easy. It also supports responsive design out of the box. This allows my site to grow and shrink as the screen size changes. So it looks great on everything between a cell phone and a huge desktop monitor. 

###Goals
I have three goals I wanted to achieve:

 * **The site has to be fast**
 With the combination of Node.js and Docpad's static file generation. I have a *very* snappy website. There's no need for caching plugins or mysql tuning. It also means my hosting needs are much lighter = cheaper.

 * **I want a minimal design**
 Bootstrap gives you the control to go as minimalistic or as artsy-fartsy you want. Luckily it starts out minimal and lets you use various nifties when they're called for.

 * **I want to support mobile devices**
 Again bootstrap delivered this for me automatically. I just had to include the responsive CSS file and it works like magic. It could use some refinement, but it's a tremendous platform to start from.

I did have to make one significant compromise in my Fine Art image gallery. Previously, I created a web-based image uploader. It would create smaller versions of the original image. It would extract all the EXIF data and store it in a database. I say it was easy to implement only because I know how to build something like that. Getting rid of a database with my infant knowledge of Node.js and Docpad led me to rethink how I could implement this without weeks of development.

I ended up moving all of my images to my Smugmug account and then setup my portfolio to work sort of like a blog. Only it's pulling the images out of my Smugmug account. The biggest drawback is having to manually input all the image EXIF data for each shot. The big upside now is having the ability to utilize Smugmug's e-commerce features for selling prints. 

So it's taking me a bunch of time to get my portfolio filled out from all the data entry I'm doing. There are 300+ images. I don't publish more than a single Landscape every day, so it won't be such a burden once I get it all caught up. 

###Take Away
My site is far from finished and I've had a few weeks of little sleep learning and hacking, but I'm extremely satisfied. I have clearly met me goals and I think the user experience is very positive. I love minimalistic design because it focuses on the content rather than the medium. I don't want people to necessary think about my website, I want them to notice my photography and witty blog posts. I also want all of this information to be easy to find with clear navigation.

Like any website, they are *never* finished. This only the begining of a new edition. Check back often to see my portfolio fill out. I am going to updated my [portrait photography](/portrait-photography) page with new packages and pricing. Subtle things like RSS links so you can subscribe to my blog feed and social icons so you can follow me on Facebook. 
