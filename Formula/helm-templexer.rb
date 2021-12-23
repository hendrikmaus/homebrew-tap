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
