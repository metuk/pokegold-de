# Pokémon - Goldene Edition & Silberne Edition [![Build Status][ci-badge]][ci]

This is a disassembly of the German versions of Pokémon Gold and Silver: Pokémon - Goldene Edition and Pokémon - Silberne Edition.

It builds the following ROMs:

- Pokemon - Goldene Edition (Germany) (SGB Enhanced).gbc `sha1: 9254195d461ea942eaaa08cc4b83de3cf82aea0d`
- Pokemon - Silberne Edition (Germany) (SGB Enhanced).gbc `sha1: 8ecc58d621faaedf2a934bd2583d527220df7bb9`

To set up the repository, see [INSTALL.md](INSTALL.md).

This repository does not contain a ROM. You need your own copy of the games only to verify the build with `make compare`.


## About

This project is based on [**pret/pokegold**][pokegold], the disassembly of the English versions. It contains the German text, graphics and the code changes of the European localization, such as the box checksums, the European mail fonts and the metric Pokédex.

Many of these changes are shared with the German Crystal version, see [**pokecrystal-de**][pokecrystal-de].

This is an unofficial fan project. It is not affiliated with pret, Nintendo, Game Freak or The Pokémon Company.


## Deutsch

Dies ist eine Disassembly der deutschen Goldenen und Silbernen Edition. `make` baut daraus beide ROMs, die Byte für Byte mit dem Original übereinstimmen. ROMs sind nicht enthalten. Anleitung: [INSTALL.md](INSTALL.md).


## See also

Most of the documentation for pokegold and pokecrystal also applies here:

- [**pokecrystal documentation**][docs]
- [**pokecrystal wiki**][wiki] (includes [tutorials][tutorials])
- [**Other pret projects**][pret]

[pokegold]: https://github.com/pret/pokegold
[pokecrystal-de]: https://github.com/metuk/pokecrystal-de
[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[pret]: https://pret.github.io/
[ci]: https://github.com/metuk/pokegold-de/actions
[ci-badge]: https://github.com/metuk/pokegold-de/actions/workflows/main.yml/badge.svg
