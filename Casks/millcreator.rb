cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "0825702df3b5c66cadee96f89ebf12ea3a78746d8b31e16ccaf6a44bf8cb51c3",
         intel: "56952af4ffc7a95155318fd1502c6e61bbe1cb6eacb975a2c4bd5b1eb2a1c624"

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
