cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.80.0"
  sha256 arm:   "4a28aa55131c9a934c9bd3c54964104029ce814c6f35224184eb01ff015e566e",
         intel: "27ebe912678df9d5cc06aa360daec929780067d6e75c8e614d8998f768d36a61"

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
