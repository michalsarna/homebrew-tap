cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.6"
  sha256 arm:   "f6aeb3f4865a66e24cb5dd9af8e0b89907ff06c0afb5dc2d92501fcbd4cb3ce2",
         intel: "e4f5efed80a3b733cfebcc1c908a84a7cf589c1438596480612c9a44a4ece997"

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
