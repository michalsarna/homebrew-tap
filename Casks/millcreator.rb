cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.5"
  sha256 arm:   "eed7ddedb7956a7f0ed9588a8609d27a5735c7f4b81596c0128ead49f37e99ac",
         intel: "13b7ec4d582350cb5a348a40707ac74452921887792080692d952ffabe9a63e4"

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
