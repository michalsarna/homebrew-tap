cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.5"
  sha256 arm:   "b9e5406d1943dfbe3c9f5084a88d474029f22135326ae86d957fe03ff610355c",
         intel: "f70bac75700254816119a26e7af4cbf650a1333deb85466d8554a6700d5eec1a"

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
