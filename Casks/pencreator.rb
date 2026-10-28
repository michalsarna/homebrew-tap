cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.1"
  sha256 arm:   "9a646f9a1cf1eff31efd7341314b4871ec3c204a29e4e97da456d0c996f3e6f8",
         intel: "eb24c0c345692d27f217ce3530ea94f554f9cc020389e88eb4b6a48e1b09199f"

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
