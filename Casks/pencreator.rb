cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.3"
  sha256 arm:   "877bb77c78320003d7015de45a35c0deb3e5a197aa6d2f1e9c794b66bb875662",
         intel: "b08bcdd6b5bb09d1f9b2ad93ca60e38c1e9be10c49dff58db0e35de79a49b236"

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
