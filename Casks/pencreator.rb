cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.2"
  sha256 arm:   "54e65af47f0d9ea055ec85f44ac5933cff875f0a1e04f30023bb19ea09dcbf46",
         intel: "5bfd24dddbafc845a60415c1b855a036ebecbb6b48358c26d219bb97f94bf9dd"

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
