cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.7"
  sha256 arm:   "ea865360fca3d10c8f40ec1cbf55c9e71d2bdeea91390451bb72de1a888ab97e",
         intel: "7a919051fa4084fb9b8574b3ac70333bd818b04caddae9ffb75bce5eacca01c3"

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
