# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	plugins:
	    sitemap:
            cachetime: 600000
            changefreq: 'daily'
            priority: 0.5
	    feedr:
	        feeds:
	            twitter:
	                url: "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=ericlesliephoto&count=2&include_entities=true&include_rts=true"
	                

            

	#watchOptions: preferredMethods: ['watchFile','watch']

	# =================================
	# Patterns to ignore
	# Use this to expclude files/location from beging watched.
	ignoreCommonPatterns: process.env.NODE_IGNORE_COMMON_PATTERNS ? ///
		^(
			gallery|

		)$
		///i

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://ericleslie.com"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.ericleslie.com',
			]

			# The default title of our website
			title: "EricLeslie.com"

			# The website description (for SEO)
			description: """
				A new photographer exploding on the scene
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				photographer, wedding, portrait, red bluff, redding, chico, commercial, 
				"""

			# The website author's name
			author: "Eric Leslie"

			# The website author's email
			email: "eric@ericleslie.com"



		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')


	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		# For instance, this one will fetch in all documents that have pageOrder set within their meta data
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		# This one, will fetch in all documents that have the tag "post" specified in their meta data
		posts: (database) ->
			database.findAllLive({post: $has: true}, [date:-1])

		# This one, will fetch in all documents that have the tag "post" specified in their meta data
		images: (database) ->
			database.findAllLive({image: $has: true}, [date:-1])


	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

	# =================================
    # Environment Configuration

    # Locale Code
    # The code we shall use for our locale (e.g. `en`, `fr`, etc)
    # If not set, we will attempt to detect the system's locale, if the locale can't be detected or if our locale file is not found for it, we will revert to `en`
    localeCode: null  # default

    # Environment
    # Which environment we should load up
    # If not set, we will default the `NODE_ENV` environment variable, if that isn't set, we will default to `development`
    env: null  # default: null

    # Environments
    # Allows us to set custom configuration for specific environments
    environments:  # default
        development:  # default
            # Always refresh from server
            maxAge: false  # default

            # Only do these if we are running standalone via the `docpad` executable
            checkVersion: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default
            welcome: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default
            prompts: process.argv.length >= 2 and /docpad$/.test(process.argv[1])  # default

            # Listen to port 9005 on the development environment
            port: 9005  # example

        production:  # default
            # Always refresh from server
            maxAge: false  # default

            # Listen to port 9005 on the development environment
            port: 80  # example

}


# Export our DocPad Configuration
module.exports = docpadConfig