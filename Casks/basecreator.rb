cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.9.9"
  sha256 arm:   "6669db87b1907cd0943f420c5207186311df0ffeeb3316818a0823a513cc1578",
         intel: "880add3aff3f5cddb1fff2c5c6c6c6ded2205817aa2cf0a35843fdb2f9a7029e"

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
