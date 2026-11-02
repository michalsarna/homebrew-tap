cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.4"
  sha256 arm:   "428898bc16aef8d6a6a6e32207cc65f4e4901ae602a6cd7630faac6470d40b92",
         intel: "30f741c3f7c3e1a99e9e1ddf85bf4f55a43e9c7f40ea28c988eb2d84279f5c21"

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
