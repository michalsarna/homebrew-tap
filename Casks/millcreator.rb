cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "32aca352f86ff68d0cfa321234a62d12f77b290c466c093a096bbc90a28f33e2",
         intel: "1c98cbac73384984871ce5175ca0993fe7a4c48ff828e8d38457fd37492c50cb"

  url "https://github.com/michalsarna/MillCreator/releases/download/v#{version}/millcreator-v#{version}-macos-#{arch}.dmg"
  name "MillCreator"
  desc "CNC milling software with toolpaths, 3D view and G-code"
  homepage "https://github.com/michalsarna/MillCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MillCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/millcreator"

  caveats <<~EOS
    MillCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MillCreator.app"
  EOS
end
