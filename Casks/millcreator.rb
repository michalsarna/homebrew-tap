cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.8"
  sha256 arm:   "3810c22098db2ec44804bd7932241ddb41bf9147d0b89e2a4ff28edee03239cd",
         intel: "1ff669444daef00acef116bb03d3b2614f3517b19d6ec4e4090ad988989c994e"

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
