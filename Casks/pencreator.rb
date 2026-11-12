cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.7"
  sha256 arm:   "9508dfc1b2c67108b0b86787ce6660d408680b5cdcd4d21bb7cb55ec622a7f3e",
         intel: "d736766eff10bdf01825680521639ec6a64c8e89a43701f10f857330d7c992fe"

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
