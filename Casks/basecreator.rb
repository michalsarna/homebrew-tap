cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.82.1"
  sha256 arm:   "6c180753c4a30256526ad2a1677cb6a2dbc66fb1f0d3bc2b905beeb8385b58e1",
         intel: "62de6d16f59195120f2965f58ebf5140fba0379458d6b266ba6d65fbdac94718"

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
