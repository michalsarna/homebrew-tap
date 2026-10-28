# Homebrew tap for the Creator apps

[LightCreator](https://github.com/michalsarna/LightCreator) (laser), [MillCreator](https://github.com/michalsarna/MillCreator) (CNC milling) and [PenCreator](https://github.com/michalsarna/PenCreator) (pen plotter) for macOS (Apple silicon and Intel, macOS 11 or newer).

```sh
brew install --cask michalsarna/tap/lightcreator
brew install --cask michalsarna/tap/millcreator
brew install --cask michalsarna/tap/pencreator
```

`brew upgrade` picks up new versions; the casks are updated with every release.

The apps are not notarized by Apple yet. If macOS refuses to open one the first time, right-click it in Applications and choose *Open*, or run `xattr -dr com.apple.quarantine /Applications/LightCreator.app`.

More: <https://michalsarna.github.io/creatorapps/>
