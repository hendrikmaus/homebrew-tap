class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/0.3.0.tar.gz"
  sha256 "aa4c377a6766b15dc6f8f2b86408b06dfacab0505bb83eaff5d1839aed456540"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.3.0_1"
    sha256 cellar: :any_skip_relocation, catalina:     "e47f2bc025bd1596a4a20801ece0f798b95e272166ad3e4d352a148d7facaa6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "19b986608135ed2b78ecd25da6e51e892f0a8c4e4398f34ea0b295c52e1cb529"
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
