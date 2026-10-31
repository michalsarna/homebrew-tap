cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.2"
  sha256 arm:   "b8771437a75cb83b4643d3281bd37bb3ff3867eb28a4f5e38315e9c49945171d",
         intel: "44466ba2df68a70e605c090eafa3462793dbf1dfb0ade3869a811d359afb9eba"

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
