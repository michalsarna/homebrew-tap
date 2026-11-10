cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.5"
  sha256 arm:   "6c5a9cbbd65404a8f604407d3e95ca345f555702879712b12a5f699ba350103d",
         intel: "877e4e563e2e08840a2340ef6fc18898233a657b5bf4426e9a0cbdcdc00f49bd"

  url "https://github.com/michalsarna/PenCreator/releases/download/v#{version}/pencreator-v#{version}-macos-#{arch}.dmg"
  name "PenCreator"
  desc "Pen plotter software with pens as layers, plot preview and G-code"
  homepage "https://github.com/michalsarna/PenCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "PenCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/pencreator"

  caveats <<~EOS
    PenCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/PenCreator.app"
  EOS
end
