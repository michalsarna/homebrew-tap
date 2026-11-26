cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "1829269f5d8ac8258ec690c389cecca2722c4fa600d300c3f6d045f99d06873e",
         intel: "5b37a7db95037f716cec6dc94ed9ffbaf0dcd28d851dbec2fb614a5da6de1d33"

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
