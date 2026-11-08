cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "5da02af8dd4468997fd5e7f02e107dab5665e3d0b73e74cceb0a5f09214facc6",
         intel: "14d1f09dce743b1900f90d3fc0decdc0532f9762f2c12f09eb3742e6804e6dbb"

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
