cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "9f277782aac72c8e7d7fb1612345abf9ae7c2859148b9c7fcc1e24c2ccba5a4a",
         intel: "7330d05147bcefff7c1c239c896521658f07e593ab25731b821338aa40d062ab"

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
