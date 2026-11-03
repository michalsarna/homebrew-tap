cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.8"
  sha256 arm:   "b0972f12ead34c50470990a1916bbd26b4c1cda0b84fe5ce91a7b06982728417",
         intel: "d7ee27033d18975504b842027737733ff9d55f02aa77b1b22a9c7f6244183cbc"

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
