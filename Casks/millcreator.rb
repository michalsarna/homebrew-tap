cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.1"
  sha256 arm:   "97ef1fc86e2cb2afaa6758fed2def2734914e25b4d895606ab1d158f08b61508",
         intel: "60318862c32d7e7e49075ab31e5a6e260b336b6f15443195e2cbeec0f387b5ba"

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
