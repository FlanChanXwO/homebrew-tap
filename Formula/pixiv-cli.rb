class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.0/pixiv-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "ba35ad4ace42f7416c1fb3cae824329c47979d450be02fa0d0cbab81569e39c7"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.0/pixiv-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "5c4aeedb1a3640ab01aa31b4f1fb0b32cb8c92db0e75d2ddfd1c1d2579dddc91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.0/pixiv-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "40685d3f618d1c22500fe10813f7203a9a44541ee7ddfa7e08fdf09148a9fbe4"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.0/pixiv-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "d4d62230e295df372c7200cb4907087607d284931ea4ada8b813b77a6de2425f"
    end
  end

  conflicts_with "pixiv-cli-beta", because: "both install the pixiv command"

  def install
    bin.install "pixiv"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
