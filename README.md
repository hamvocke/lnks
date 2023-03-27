# lnks

`lnks` allows you to search through and open browser bookmarks on the command line. Use it for yourself or to share important bookmarks with your team.

![lnks demo](/demo/demo.gif)

Check out [my blog post](https://www.hamvocke.com/blog/lnks-command-line-bookmarks/) for more details.

## Setup

Before you can get started, you've got to set up a few things once.

### 1. Install `fzf` - the command line fuzzy finder

`lnks` is just a small script around `fzf`. Install it by following the [installation instructions](https://github.com/junegunn/fzf#installation) or simply by installing it from your package manager of choice:

```bash
sudo apt install fzf # Ubuntu
brew install fzf # Mac OS
sudo pacman -S fzf # Arch
choco install fzf # Windows
```

### 2. Grab a copy of this repository

`git clone` this repo, fork it, or simply download the `lnks.sh` and `bookmarks.txt` files to your directory of choice.


### 3. Add your bookmarks

Following the pattern in `bookmarks.txt` add all your bookmarks into one (or many) `.txt` files next to `lnks.sh`.

Like this:

```txt
My bookmark https://example.com
Stack Overflow https://stackoverflow.com
lnks Git Repository https://github.com/hamvocke/lnks
```

The rules:

* One bookmark per line
* Each line consists of a searchable name and a URL
* The URL goes last and is separated from the searchable name with a `space`
* The file needs to have the `.txt` extension
* You can have as many `.txt` files next to `lnks.sh` as you want


### _Optional_: Create a global alias for easy access

Add this alias to your config so you can type `lnks` from any directory to open your bookmarks:


```bash
# add this to e.g. your .bashrc or .zshrc

alias lnks='~/your-lnks-dir/lnks.sh'
```

```powershell
# add to $profile - check location with `Write-Output $profile`

New-Alias lnks "$Home\your-lnks-dir\lnks.ps1"
```

## Usage

1. Run `lnks.sh` (Linux, Mac) or `lnks.ps1` (Windows)
2. Type to run a fuzzy search against the names of your bookmarks
3. Use arrow keys to navigate up and down
4. Hit `Enter` to open a bookmark in your browser


## Working with a team

`lnks` works well for software development teams. Use it to share a well-known list of bookmarks to your production and staging systems, your build pipelines, your bug tracker, important observability dashboards or whatever else might be relevant for your day to day work.

Fork this repo, add all your team's important URLs to a text file and share the git repo with your team. Team members can add, update and remove bookmarks and check them back in to your shared repository to ensure that everyone's got up to date bookmarks to important URLs and systems.
