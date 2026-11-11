cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.6"
  sha256 arm:   "0d97e279a26e17854d4ac3c897da74af97a4ea0842fa1a0914767fc8b543b95b",
         intel: "941ac89fb5c861ebb4f74550b1c7ebca0c40197b7777f5f8d6c5f4470aa2aad9"

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
