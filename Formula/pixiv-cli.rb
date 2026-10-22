class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.1/pixiv-cli_1.2.1_darwin_arm64.tar.gz"
      sha256 "6ae6262faf3aaae3062c8ff053d3e5561b27987e908c7209a03f7d2db48df653"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.1/pixiv-cli_1.2.1_darwin_amd64.tar.gz"
      sha256 "3aa5327fa567ceba1ec03496bdfcffab38a266b17c43d8388ae8f05cfb41f417"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.1/pixiv-cli_1.2.1_linux_arm64.tar.gz"
      sha256 "0c76358df8928a372fcbf19f4422d7b7f099fdda41e0073ee6ddc7ac3bb795bb"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.1/pixiv-cli_1.2.1_linux_amd64.tar.gz"
      sha256 "6b166b27a481d010855d876d5830355d37f146dff3437afb52213345be875448"
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
