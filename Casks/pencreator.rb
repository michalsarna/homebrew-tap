cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "7f4928d12fc1bd4acfac5d8804ad4c91dd9dbafe652a05fa4c3e7d305f640b0d",
         intel: "dc0a18bcef033d7941581bd49c9bb7102bb21c67e0cdad5b9b78ab6789483aaf"

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
