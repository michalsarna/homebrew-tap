cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.7"
  sha256 arm:   "952b257a39fdfb9227d7a840b33a374169e961e6aec9b0b63caf99ddf51f8790",
         intel: "f7d6b03ffe52c7aa1cb3cd935024c609d7addca8143ee1c2e9de0de4470a2618"

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
