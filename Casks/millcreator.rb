cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "a6d57409beea01559a1cd80b954e1cc9226dd149940e07a4d03e8076dbc0393f",
         intel: "bdbed795ff7b3c28d8fa5be465ce8e765f7cadd736bca60e9b86841b48767264"

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
