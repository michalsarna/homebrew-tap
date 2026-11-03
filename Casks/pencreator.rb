cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.6"
  sha256 arm:   "7c7109bbd2028c228b90fe9b7d10aecfc91759d9f61e876e1b69d5aa32c3350a",
         intel: "ae4ea5533412255b57f384a25c071451ed8c441e7f30234135bcea8606065c7b"

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
