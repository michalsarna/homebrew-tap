cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.2"
  sha256 arm:   "c6986173019dc07b7d252ab2449137ee9e311e7cca9fb90347b864ae2f5dece0",
         intel: "5ea4f74f9737062c827c78273c118a3f77ebcfa65f1eb1e62e4f33c326d78cb8"

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
