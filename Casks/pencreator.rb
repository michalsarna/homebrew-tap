cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.10"
  sha256 arm:   "a9abdb4511d07873b8fa485767cb93c37b805686ed7d7465c291742cf9dd6c7a",
         intel: "75ea3568b2dd185fe18405041068d3f7167c93cb7ee518c5351fd4e815c06dc8"

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
