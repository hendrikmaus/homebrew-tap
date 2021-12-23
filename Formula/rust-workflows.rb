class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "646bcd7da9e9ce1fbf53f47a33d5a075785cd07255ceccae8cf9ce79399eef79"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.3.1_1"
    sha256 cellar: :any_skip_relocation, big_sur:      "050151fb4d61a0526cefb0e908c147126134562d487f8714c2fddb93c02e7a52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6629df495ea8fc792f55e7e0915ff297b21f717f058c8ff49f4cd89fac33294"
  end

  head do
    url "https://github.com/hendrikmaus/rust-workflows.git", branch: "master"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/rust-workflows"
  end
end
