cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.4"
  sha256 arm:   "e7972f3b8bd98936f2cd9847ec984c125531fbf8d949474fd2cace60b94748dd",
         intel: "73d3355ecae2d7a941461741a2f5660042787e583d60d2a00721b7af4ded70f4"

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
