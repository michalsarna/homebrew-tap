cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.6"
  sha256 arm:   "06e5d6c45e675730882b824253aba8ab0217b1d27c37b073497c445010191cf1",
         intel: "6bc38ea701d53b94ebbfab02bebb5838b9120fad263c5b24ec9d1f9b039c17b6"

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
