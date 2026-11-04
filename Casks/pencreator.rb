cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "00acdcc133d4ad750a7587dfe222d24787204eb13101668e564909b56a7b54d0",
         intel: "a77c07bf2b74f36ccf5142df9bc81733b213a0312b9eec6303c13ef79d48204c"

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
