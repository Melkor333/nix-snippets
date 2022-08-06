# State

This project is currently in heavy development. As soon as the main functions are working, it will be announced.
Until then any Suggestions in form of Issues are veery appreciated, but since the whole code is changing a lot, it won't make sense to make any Pull Request.

There are still problems which have to be solved like what happens when two snippets are incompatible to each other or how to update a snippet which has been modified locally, but I'm sure that future me (us? :) ) will find solutions!

On a side note: `nix-snippet` is written in [oil shell](https://www.oilshell.org/), which is a still very new shell scripting language. It's a language I've been following for a few years now and really want to try out!

## TODOs before v1

- [x] `nix-snippet list`
- [ ] `nix-snippet apply SNIPPET` (or `add`, not sure if `apply` makes sense)
- [ ] `nix-snippet remove SNIPPET`
- [ ] `nix-snippet diff SNIPPET`
- [ ] `nix-snippet ignore SNIPPET`
- [ ] Come up with an idea for placeholders in snippets
- [ ] create a package (and add to NixOS)
- [ ] some way of defining snippet sources (maybe something like to `nix-channel`). Currently only snippets in this repo work
  - [ ] A definition of how a source has to look like
  - [ ] `nix-snippet update`
  - [ ] `nix-snippet source add`
  - [ ] `nix-snippet source remove`


# Idea

Use reusable and easily managable snippets for your Nix Config instead of writing everything by your own!

NixOS solves many problems like declarative builds, reproducibility, etc. But currently missing are "sane" and/or "easy to use" configuration presets for NixOS as a Desktop system.
The defaults of NixOS modules are usually very minimal and it should always stay that way. But that means that everybody has to configure NixOS "from ground up", similar to how someone would approach e.g. Arch Linux or Gentoo, etc.

There are a few things which try to make configuration a bit easier, e.g. the [nixos-hardware](https://github.com/NixOS/nixos-hardware) and the NixOS Wiki is very helpful in explaining how to configure things.
But even with all this it can still be a hassle to configure everything from scratch. Getting a system as convenient to us as e.g. a Manjaro or Ubuntu Linux takes a lot of time.
The very fast pace of NixOS and every now and then breaking changes also require people to stay up to date all the time, which is very time consuming.

`Nix-Snippets` tries to make this easier to some degree by giving the ability to easily integrate "snippets" developed by other people. The intend is that people can develop snippets together but still customize snippets as they wish.
At the same time it will hopefully "standardize" NixOS configurations a bit and promote best practices.
Examples for snippets can be e.g. sane laptop standards, preconfigured programs like Vim or Steam up to full configurations of window managers with desktop like experience, etc.

# How it works

It's still in development, but once finished the workflow should roughly be:

- Run `nix-snippet init` to setup the folder `/etc/nixos/snippets/`
- Use e.g. `nix-snippet apply nvim` to create the file `/etc/nixos/snippets/nvim.nix` and automatically have it imported.
- The file `/etc/nixos/snippets/SNIPPET.nix` can be edited to your wishes
- Run `nix-snippet update` to fetch the newest snippet versions and get a list of snippets currently in use which have been updated by upstream
- `nix-snippet diff SNIPPET` to see what actually changed with the newest snippet version
- `nix-snippet apply SNIPPET` to actually apply changes from upstream if you want to have them
- `nix-snippet ignore SNIPPET` if you don't want to see any future changes from SNIPPET
- many commands usable to make sharing snippets easy like `nix-snippet upload`, etc.
- ...

# Setup

TODO: Create command "init" which makes everything necessary to use nix-snippets

Create a folder `/etc/nixos/snippets/` and in there you want to create a file `default.nix` looking like this:
```
{
  config,
  pkgs,
  ...
}:
{
  imports =
    [
    ];
}
```

Then you want to import this file in your `configuration.nix`

```
{
  ...
  imports =
    [
    ...
    ./snippets
    ];
  ...
}
```

# Snippet guide

List all existing Snippets and their status. Initially every snippet will be `new`:

```
./nix-snippets.oil list
nvim: new
```

# Future ideas

- [ ] Meta snippets/bundles (snippets which involve other snippets)
