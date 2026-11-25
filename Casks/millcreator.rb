cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.10"
  sha256 arm:   "e86c2da49dc4dbe0fcbc22f4c2d2d09fea5cc3eec005c53860d8881023d87d20",
         intel: "3b187a1e96f619c4614a0417b2af134473faa24d8807838c1aa8293f4f06cb56"

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
