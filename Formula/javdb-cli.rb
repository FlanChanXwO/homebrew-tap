class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.0/javdb-cli_0.6.0_darwin_arm64.tar.gz"
      sha256 "ab2d7d7b0706ab7fecb035836e1e3b83ad8c4e1323447b5e62f42dea56e654b9"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.0/javdb-cli_0.6.0_darwin_amd64.tar.gz"
      sha256 "42e47b70265ae66406911108488d391b9896af61d6fbf447ae6dc25c77570b1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.0/javdb-cli_0.6.0_linux_arm64.tar.gz"
      sha256 "45988650472ef820ee2d0eac1c484bdbcadafaab786f403a641236e49107d1cf"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.0/javdb-cli_0.6.0_linux_amd64.tar.gz"
      sha256 "a5c67f8af0a6bb76ddd43b943ee0e004e00840df92ff28fa299e9942280cceec"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/javdb version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
