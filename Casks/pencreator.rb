cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.1"
  sha256 arm:   "f478bb91402964a0d17098919afb7361e031c1f091e017a87c964c4736a76545",
         intel: "109f22d51bb6ec34576a78e1a744023c83a69e8f61242a22778376f15b6aeb21"

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
