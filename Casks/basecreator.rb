cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.0"
  sha256 arm:   "95699df8efd4e556a41f6e14171acb5565ebeff9ae42b5a8081146302b28be91",
         intel: "3f7c1adab00febc61760420e991f2f78603fd315a56e901fb5e067b5a03ca681"

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
