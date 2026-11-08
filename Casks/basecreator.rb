cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.79.0"
  sha256 arm:   "35239fe2f95678b84f7aeb3a5f1f5fdd64525022960e04081d0700a72fb6e678",
         intel: "7587cbb36bfd284febf3a01389b8ed545d8ddd5501ef6ac63c507e996c148deb"

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
