cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "6b95a8077430055788c5a0dfbbc5ca9b1d8734cad338d32fb6fa29e3caf8a590",
         intel: "283c4c541c9d83e34685b283b87b03a1634107d8aafb794dff4dd71e9bd93bea"

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
