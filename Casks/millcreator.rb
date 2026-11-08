cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "ed9a0f9b57cb65ff43e06fc696f7ecb0aa7dc52f2d7550aaac47ab0c46055a7f",
         intel: "1cac1187eb1f8790d8e9e9fdc9200c3e11a8354064890305a26d37664f43ff0d"

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
