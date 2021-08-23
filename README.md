# Homebrew Tap

## How do I Install These Formulae?

`brew install hendrikmaus/tap/<formula>`

Or `brew tap hendrikmaus/tap` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Adding Formulae

- Add the formula to the `Formula` directory
- Open a pull-request and wait for its checks
- Once good, add the label `pr-pull` and wait for the release

## Updating The Version of a Formulae

- Open a pull-request and change the version and shasum
  e.g. https://github.com/hendrikmaus/homebrew-tap/pull/5
- Wait for the checks to run
- Add the label `pr-pull` to the pull-request
- Done
