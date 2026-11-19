cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.7"
  sha256 arm:   "62fdbd045d003d320a15558e08872f51d0931b8be2afc3e18118bb52313a0ec9",
         intel: "9c6c8783210210d02fc9869f8d7630e015247dd95045f09b1c72ea2e511262c1"

  url "https://github.com/michalsarna/MillCreator/releases/download/v#{version}/millcreator-v#{version}-macos-#{arch}.dmg"
  name "MillCreator"
  desc "CNC milling software with toolpaths, 3D view and G-code"
  homepage "https://github.com/michalsarna/MillCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MillCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/millcreator"

  caveats <<~EOS
    MillCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MillCreator.app"
  EOS
end
