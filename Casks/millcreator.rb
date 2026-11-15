cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.4"
  sha256 arm:   "eee4508b99b4f635e3c1a6722439fc24a67b90d926f76e589980f1f6c6de96bd",
         intel: "9636e60275d5a4694e5684ee9d3fb85b70fd4e9247144a55f48749f620ea8dba"

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
