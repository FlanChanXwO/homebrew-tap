class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.0/pixiv-cli_1.0.0_darwin_arm64.tar.gz"
      sha256 "d8842bbc054c521e2d2e7fc77e59aa4f1cdd599c318bb91eb7f145573d493ee8"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.0/pixiv-cli_1.0.0_darwin_amd64.tar.gz"
      sha256 "4002dcaebd659548e3cf46071226dc0dab89a3bad28731fc9336b9cef1d9aa14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.0/pixiv-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "e729e44f0f7323bbb0e3fb24660c08cea667b4814a4cd3353ba695aa02629f90"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.0.0/pixiv-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "c94621a713f9700958d36ac24a886ad9158f39fadfed7e2bbcdb975f761405b3"
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
