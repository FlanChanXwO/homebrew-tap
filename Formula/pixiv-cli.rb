class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.1/pixiv-cli_1.1.1_darwin_arm64.tar.gz"
      sha256 "b836e9ea9106a8bf7dfe98e6d74176ceb6860c39253f1610076bf1428775a135"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.1/pixiv-cli_1.1.1_darwin_amd64.tar.gz"
      sha256 "81cce6e84a7541b1cbbf0e9b72157c75812e84b1ba0390f316913587338ba33e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.1/pixiv-cli_1.1.1_linux_arm64.tar.gz"
      sha256 "4b2b3f2682069be8b62de31adec3f5ed99d175e7ccfea33c40299cbf951ddd87"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.1/pixiv-cli_1.1.1_linux_amd64.tar.gz"
      sha256 "db0866a23e64e59a7d90b8e66e772b120d034d0e8f22e8c340211cc938af6edf"
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
