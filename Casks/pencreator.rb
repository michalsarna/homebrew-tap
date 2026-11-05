cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "4cb69cce5690b48390f55722a1068cf6f2036c9ae8d46d5886823c8c29b4153d",
         intel: "a76cfb4ac0cefa1d9ca2f4f79059f7422298eceb79c23afa7032c67982b18c13"

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
