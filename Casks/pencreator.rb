cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "81cec0bcb7785fe5c4fc1a13418b2f00dc20aeb615a75e5c921d124b90da94b7",
         intel: "f1c6d5b9b5a43bf48ea8d6536739ca0996edd337cb43db62a210046df4b52ace"

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
