cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.8"
  sha256 arm:   "e300ebc0c01885ec51d979faae94e4455d820b255533b6559092d1692456fdf1",
         intel: "1f36832e641e7efd180908d86dd4c81bbe7e00ae1ff4516475357de245be1106"

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
