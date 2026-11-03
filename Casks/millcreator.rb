cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.6"
  sha256 arm:   "b8ac4249898ea05c517f9fa69e6f49e0383a099159aeb564ff0f545e60d92131",
         intel: "0843649196d4a9869832b58f75c3bb7ab728cce1ac32014027298789d276bbc0"

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
