cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.1"
  sha256 arm:   "f219d167c6b8103ef520f6e9d4420c073c2c58ae70e6e37ffe3fae955c30c5a9",
         intel: "0e935c748e4e1eb8b86d35633a465e2193ef9b892f3e6bcb9fc394ef4a0d9244"

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
