cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "9d8fda9f2101001fcd542f2a739b7cce1ee2ea9a7a5ab7177377f24de241328f",
         intel: "dfb3bbf6e9bc29c16d4bf22d104dbdd7d21aa14db3723e8646a7f8a974554a8e"

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
