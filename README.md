# videogames.pixelastic.com

This repository holds the code of
[http://videogames.pixelastic.com/](http://videogames.pixelastic.com/) where
I put all screenshots and video footage of the games I play.

## Development

The website itself is made with Middleman, but I also use a bit of custom
JavaScript code to upload the video (which itself delegates to
[youtube-upload][1], a python script).

If you want to run it locally, start with an `npm install`, it will install all
the dependencies.

Then `npm run build` will build the website, `npm run deploy` will deploy it and
`npm run serve` will serve a local version.

[1]: https://github.com/tokland/youtube-upload
