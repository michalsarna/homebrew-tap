cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.5"
  sha256 arm:   "624b10fba55ee41eeb6ad6ac4802f775c93fad46510f8f08393a69df4e4d863a",
         intel: "65e0566b7e061807a399392d0345eea329a1b906dc27a1f7377bca29489081b9"

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
