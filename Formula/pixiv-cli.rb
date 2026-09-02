class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.1/pixiv-cli_1.0.1_darwin_arm64.tar.gz"
      sha256 "c6af1bdb03a04b0723f32b965abf062d1beca390a5ec1d3f600af881df171165"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.1/pixiv-cli_1.0.1_darwin_amd64.tar.gz"
      sha256 "00ca968858cf13ebe6cc31e3182340e73478f9ccd77272d00b724d56bad91df4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.1/pixiv-cli_1.0.1_linux_arm64.tar.gz"
      sha256 "febb8857df41c879aca93bf46bd74281c4e959c941cee4d5346cf54b9fdde43a"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.1/pixiv-cli_1.0.1_linux_amd64.tar.gz"
      sha256 "d2e4a80f9fe7e6d4353aecce8f6e6203ea473fd3188c1c9ee5b61af766a63298"
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
