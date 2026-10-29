cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.2"
  sha256 arm:   "cc0ff286616f0a81617fe8e066bed1b26491d138256233c0b913cb64ffc4cb16",
         intel: "89508ae39855d379c7b6c11ce7a6dd7bd702998b091995425acb040c4827c462"

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
