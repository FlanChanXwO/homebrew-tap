class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.2/pixiv-cli_1.0.2_darwin_arm64.tar.gz"
      sha256 "425e148643389cc913c74d24d3584f4a2bd61c5650da9977f0500fe906c3e523"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.2/pixiv-cli_1.0.2_darwin_amd64.tar.gz"
      sha256 "66031e7bd5e656c9674ca4ce657cdb89fdafee417bd3a8117867b9adfc67fc5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.2/pixiv-cli_1.0.2_linux_arm64.tar.gz"
      sha256 "9dccd1d046a94e2c58f42343f8f15548b339778298e104fdd01fcfac0f2a745e"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.2/pixiv-cli_1.0.2_linux_amd64.tar.gz"
      sha256 "cb235c926e20d20f93db87a26caee3d8bad1b082d5eea0f4b5aa867fac2a7100"
    end
  end

  def install
    bin.install "pixiv"
  end

  def post_install
    # The hidden command reports integration failures without invalidating the
    # verified Homebrew installation; a normal browser login retries it.
    system bin/"pixiv", "auth", "_install-handler"
  end

  test do
    assert_equal "pixiv v#{version}\n", shell_output("#{bin}/pixiv --version")
  end
end
