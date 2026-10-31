cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.2"
  sha256 arm:   "d7ddedbcdee5af0e80c2eeae8cbd7a45e23ef7dbdf61e33d6d96e9735637027e",
         intel: "3803a5997f76778d7bf62155efcaf7345603df9336f1eef99cda34e168d3e6f0"

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
