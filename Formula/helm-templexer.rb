class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/2.0.0.tar.gz"
  sha256 "52fdb2c2becba7489a2713cfb966b453d6bae94b16c9ba79209688cfe5ce0318"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-2.0.0_1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur:      "f1268439a67c0b41f0c71841f7d03ad7e8634acb6c29e7ee4e217305b2e20870"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f97f359f398438cb8fda482be816fbb03002600531565a8e187ca1cf9011f70c"
  end

  head do
    url "https://github.com/hendrikmaus/helm-templexer.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "helm-templexer", shell_output("#{bin}/helm-templexer help")
  end
end
