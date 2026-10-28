cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.1"
  sha256 arm:   "16b47cbcc8d5b211763f3a6cc33c2ddb18ca04cf96e312956efb73e6fb7e1c6c",
         intel: "bc1dddbaf96fd1139c892b5c7b16ffdd4d1bb1b75dc2d89402e76c0819fa786d"

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
