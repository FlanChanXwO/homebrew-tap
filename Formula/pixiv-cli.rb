class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.1/pixiv-cli_0.9.1_darwin_arm64.tar.gz"
      sha256 "3e9ac9f6f647ba5c1e75b2cd9bc9aab8e2082b3d94c4f8786e928f186d312edb"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.1/pixiv-cli_0.9.1_darwin_amd64.tar.gz"
      sha256 "25771f1b4c1a7c8fe118c4af8b9bfe76f901a0d87e13f6fd7a641a32aea38fd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.1/pixiv-cli_0.9.1_linux_arm64.tar.gz"
      sha256 "91423340d7ca3fa1b646b0c9c5f45cf6ef299fdd577038304c70afd25be69c09"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.1/pixiv-cli_0.9.1_linux_amd64.tar.gz"
      sha256 "efcb69f6afaa8c22029e65adca5bec808fb494dfba4412e3beea993d0bd656ce"
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
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
