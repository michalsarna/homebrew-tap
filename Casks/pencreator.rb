cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.7"
  sha256 arm:   "f3cf343d48bfad05431b6e98cbfe82a30903ebd70de9279b24d77701af4b0b1f",
         intel: "621d1405d2a33e3d2bf2ef789e97447890cd796d5e9bc86d67bc18db20f682bf"

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
