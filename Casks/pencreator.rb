cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "3cbfe287ab36fdc6ba3967b8bb923dadd93cbf85992e2d5cbb7f81641641b17c",
         intel: "2bcca678ec7ba74702a3f7bcf306ae2da6b76aa9e3ce2781f898eeec369200c9"

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
