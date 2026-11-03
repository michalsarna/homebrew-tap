cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.9"
  sha256 arm:   "56f31c2fcc182778f24759d25e82297afe9408660e954b900d6778fd6929d8b1",
         intel: "d5731eb14e6fe4e30e9d736a6274ff25ded55d487df116b37b9a696bb8c8b9a4"

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
