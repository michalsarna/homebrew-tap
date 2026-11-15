cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.5"
  sha256 arm:   "54d79fd808524f7897e5fe6f82ee08643a34a63f5b4f759fe369691d0a51ced6",
         intel: "0d68116422112329be25351b7441fac69f4f89f8c1dda4f160dc0f56ff485acf"

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
