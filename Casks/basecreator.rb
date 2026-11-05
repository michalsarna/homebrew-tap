cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.69.6"
  sha256 arm:   "cb709260b441027dd46b2e8c2d9a388a41d6d7cca0648b4ccfb89c97b0eaf60c",
         intel: "362cf271549405ac43ee85693c6d70f12b4fc38307d579dbfdda3c4f9665aa8f"

  url "https://github.com/michalsarna/baseCreator/releases/download/v#{version}/basecreator-v#{version}-macos-#{arch}.dmg"
  name "BaseCreator"
  desc "Drawing program that writes the project files of the Creator apps"
  homepage "https://github.com/michalsarna/baseCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "BaseCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/basecreator"

  caveats <<~EOS
    BaseCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/BaseCreator.app"
  EOS
end
