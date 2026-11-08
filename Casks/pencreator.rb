cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "2bb03fb5b4054e6e276c38f1b925ddb4944db2bb25feeb1ba75045ef806e8691",
         intel: "c663371c60334ec85dbcdcad1e77b96bf9ceb005d66bea494b0bcbc2042561e7"

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
