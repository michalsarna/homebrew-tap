cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.1"
  sha256 arm:   "70a278bfbfb5eceda07423b18b590d608aff4a711cffd041125d1fc8a7535a8f",
         intel: "08ba6266b6e2c7409c8dd0d5fc7981739c6cb2f7894270ad11ef310dd6a35135"

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
