cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.5"
  sha256 arm:   "584e121309bc04afda87c6de3fbcd2f6dbf19520ccaec6b45aaceebcc5c80f10",
         intel: "f00708c9b4df7541546d1f1a1002ba74143cdbb11bd17716b33741a9d0654f5f"

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
