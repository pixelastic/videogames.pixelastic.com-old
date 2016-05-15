# videogames.pixelastic.com

This repository holds the code of
[http://videogames.pixelastic.com/](http://videogames.pixelastic.com/) where
I put all screenshots and video footage of the games I play.

## Development

The website itself is made with Middleman, but I also use a bit of custom
Ruby code to upload the video (which itself delegates to
[youtube-upload][1], a python script).

Images are stored in private git repositories (hosted on BitBucket). Videos are
hosted on Youtube.

To add a new section, edit the `./data/index.json` file. The array contains the
list of sections, in the order it will be displayed. Create another `json` file
in the same repository for each section. Use the existing ones as examples.

To add new images, just add them to the appropriate repository (used as
a submodule in `./source/images/`), and edit the matching `json` file in
`./data`.

To add new videos, put them in a directory (I use `./tmp/name-of-game`), then
run `./scripts/video-upload ./tmp/name-of-game --playlist 'Name of game'`. This
will look for each `mp4` file in the repository and push it to youtube. It will
keep list of the already updated files (through a `done.txt` text file), so if
you run the script twice, all already uploaded files will be skipped.

As the upload to Youtube can fail for various reason, I often have to re-run the
script. It should be clever enough to keep restarting until all files are
uploaded, so just be patient.

The content of the `done.txt` file can then be used to fill the `youtube`
section of the `json` files. It is a simple matching between the original name
of the file and the Youtube id.

If you want to run the website locally, start with an `npm install`, it will
install all the dependencies.

Then `npm run build` will build the website, `npm run deploy` will deploy it and
`npm run serve` will serve a local version.

[1]: https://github.com/tokland/youtube-upload
