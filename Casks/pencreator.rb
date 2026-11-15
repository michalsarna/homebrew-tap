cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.3"
  sha256 arm:   "39080d3f1a68a9c445458cd3f99daf2041e54ada6824eec48c67bc2c924bec44",
         intel: "c1ccc8e6d8b64dc374b0879f686141e932c733a5774232e7156c3abf9064bd36"

  url "https://github.com/michalsarna/PenCreator/releases/download/v#{version}/pencreator-v#{version}-macos-#{arch}.dmg"
  name "PenCreator"
  desc "Pen plotter software with pens as layers, plot preview and G-code"
  homepage "https://github.com/michalsarna/PenCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "PenCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/pencreator"

  caveats <<~EOS
    PenCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/PenCreator.app"
  EOS
end
