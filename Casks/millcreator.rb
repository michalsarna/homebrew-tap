cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.4"
  sha256 arm:   "5c6bb861e5ee3a72141b5140d8c4b394fd9e15683ed628959c485dec4de9bb34",
         intel: "c28a66cce299291e7ec1872b4ffa5ad3187ab65fe7c35e3aaee9c8c551a8a38d"

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
