cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "837853a40266d687d32d1d446443f3fe01aea3d1bb9e96960c499495c57cd050",
         intel: "6b2940ad026f265a33b7719952ea5c81e061084ddaa79b055eb2177ce41ad644"

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
