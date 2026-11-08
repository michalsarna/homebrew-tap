cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.3"
  sha256 arm:   "cc295ca272d3c534101eb66c5b544e02dbf52fa8eeb81bc79427cba7f212ce51",
         intel: "59b88f3ef401f17b44da8228736fa642f6422735023843a1a14231c8eb9e1603"

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
