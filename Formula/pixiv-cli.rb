class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.5.0/pixiv-cli_1.5.0_darwin_arm64.tar.gz"
      sha256 "3181e2fc56bb1213a4e1ce48abdab4d74e5b53ffb7357669da9c0a6b18e8f16a"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.5.0/pixiv-cli_1.5.0_darwin_amd64.tar.gz"
      sha256 "208c4dff3699da9d84ba99b2ac03a76e91ab205bea118e88659f11505fdfcb80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.5.0/pixiv-cli_1.5.0_linux_arm64.tar.gz"
      sha256 "6ec619ef3823b72b2f18f444deb73dc59fe8b30949d1ed171a8490c906d648ed"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.5.0/pixiv-cli_1.5.0_linux_amd64.tar.gz"
      sha256 "d8222266e74752c59e711c970eb5f84848964be5ef722915ee6873f0b01e3cbd"
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
