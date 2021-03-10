# VirtualFileProvider

`VirtualFileProvider` is an API package which defines protocols for a trivial virtual file provider. 

This is useful if you write software that doesn't have specific filesystem requirements; e.g. a video player. With
`VirtualFileProvider` you can implement your player on top of the `VirtualDirectory` and `VirtualFile` APIs and supply
various plugins as data sources (e.g. local filesystem, HTTPS or even stuff like
[`youtube-dl`](https://youtube-dl.org)).


## Documentation
To build the documentation, use
`swift doc generate --module-name VirtualFileProvider --output ./Documentation ./Sources` – or take a look at the
[prebuilt documentation](Documentation/Home.md).
