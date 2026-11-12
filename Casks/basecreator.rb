cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.93.0"
  sha256 arm:   "a137e9ef173c5616bd8794d3120793f8677f1884d40e53fdefa38b7e0808cfb7",
         intel: "ff50523657c26e2f0479a674e98d83aaf17f9cd7250ab1f763064a5835ce4497"

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
