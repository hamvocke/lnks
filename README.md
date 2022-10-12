# lnks

`lnks` allows you to search through bookmarks and open URLs on the command line. You and your team can use it to quickly jump to things like

* production systems
* staging environments
* bug trackers
* deployment pipelines
* team backlogs
* monitoring tools
* you get the idea

right from your command line.

## One-time setup

### Install `fzf` - the command line fuzzy finder

`lnks` is just a small script around `fzf`. Install it by following the [installation instructions](https://github.com/junegunn/fzf#installation) or simply by installing it from your package manager of choice:

```bash
choco install fzf # Windows
sudo apt install fzf # Ubuntu
sudo pacman -S fzf # Arch
```

### Grab a copy of `lnks.sh`

`git clone` this repo, fork it, or simply download the `lnks.sh` to your directory of choice.


### Add your bookmarks

Following the pattern in the `bookmarks.txt` create your own (or even multiple) `.txt` files next to `lnks.sh` and throw all your bookmarks in there.

The rules:

* One bookmark per line
* Each line consists of a searchable name and a URL
* The URL goes last and is separated from the searchable name with a `space`
* The file needs to have the `.txt` extension
* You can have as many `.txt` files next to `lnks.sh` as you feel like

Like this:

```txt
My bookmark https://example.com
Stack Overflow https://stackoverflow.com
lnk.sh Git Repository https://github.com/hamvocke/lnks
```

### _Optional_: Create a global alias for easy access

Add this alias to your config so you can type `lnks` from any directory to open your bookmarks:


```bash
# e.g. in your .bashrc or .zshrc

alias lnks='~/your-lnks-dir/lnks.sh'
```

## Usage

1. Run `lnks.sh`
2. Type to run a fuzzy search against the names of your bookmarks
3. Hit `Enter` to open a bookmark in your browser
4. Hit `Esc` or `Ctrl-C` to exit


## Working with a team

`lnks` works well for teams.

Fork this repo, add all your team's important URLs to a text file and share the git repo with your team. Team members can add, update and remove bookmarks and check them back in to your shared repository to ensure that everyone's got up to date bookmarks to important URLs and systems.
