cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.9"
  sha256 arm:   "0f5fd6d682ae526bd099eafd518e299a288cddbbff791fc0d6cbe97948223ae8",
         intel: "9c81bfb8efc02af3771120c70196e3c8bf01d698255cc51c26f59dbf1618ebe0"

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
