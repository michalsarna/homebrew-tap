cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.4"
  sha256 arm:   "405f9c95cefc782304d166cf5cbfeda46eb5a4ed270328bda45d402a42f6952a",
         intel: "03ab7cbfa09bddc66f66583b448309a868dbc6b2020879b6ab0840fd7c8351e2"

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
