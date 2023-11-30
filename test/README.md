# Tests

This is a small test that uses [vhs](https://github.com/charmbracelet/vhs) to render
an interactive demo of the `lnks` CLI to a plain text format.

It will then compare the rendered output as a plain text file against a golden master
stored in `expected/vhs-recording.txt`.

## Running the test

> ![IMPORTANT]
> Requires a local installation of [vhs](https://github.com/charmbracelet/vhs)

In order to check whether the output of `lnks.sh` stayed the same as before, run
the following steps from the root directory of this repsitory:

1. Create a new recording: `vhs < test/test.tape`
2. Compare the new recording with the golden master: `diff vhs-recording.txt test/expected/vhs-recording.txt`
3. If `diff` says both are the same, we're good.

## Regenerating the golden master
If there are changes that intentionally change the look and feel of `lnks`,
you can generate a new golden master and commit it to git.

1. `vhs < test/test.tape`
2. `mv -f vhs-recording.txt test/expected/vhs-recording.txt`
3. `git add test/expected/vhs-recording.txt && git commit -m "new golden master"`
