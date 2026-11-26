cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "0ad466a0ce6c701d845478635e52cd559db0ac28aa1be0dae91a9cb7c0019900",
         intel: "ea854d0be656f7146e49f01f2c791b41ec7135b67e333d20ba480160b188e711"

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
