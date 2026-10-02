# pokegold-de: Projektnotizen

Ziel: bit-genaue Disassembly von **Pokémon - Goldene Edition (Germany)** (`AAUD`) und **Silberne Edition (Germany)** (`AAXD`).
SHA1 siehe `roms.sha1`. Basis: pret/pokegold (Git-Remote `pret`).

## Bauen

```sh
make -j$(nproc) RGBDS=../rgbds-1.0.4/          # baut pokegold-de.gbc und pokesilver-de.gbc
make RGBDS=../rgbds-1.0.4/ compare
```

- `baserom-gold.gbc` / `baserom-silver.gbc` sind Symlinks auf die Original-ROMs eine Ebene höher (gitignored, nie committen).
- Wenn sich nur LZ-Flags in `gfx/lz.mk` ändern: `make tidy` bzw. `make clean`, sonst werden `.lz` nicht neu gebaut.

## Werkzeuge (../pokecrystal-de-tools, eigenes Repo)

Für Gold: `export DE_ROM=pokegold-de DE_BASEROM=baserom-gold.gbc`
Für Silber: `export DE_ROM=pokesilver-de DE_BASEROM=baserom-silver.gbc`

```sh
../pokecrystal-de-tools/cycle.sh             # build, locate, retext, restring, build, locate
python3 ../pokecrystal-de-tools/todo.py [FILE]
python3 ../pokecrystal-de-tools/cmp.py FILE  # Diff der Disassemblierung Build vs. DE
python3 ../pokecrystal-de-tools/romdiff.py
```

## Erfahrungen aus pokecrystal-de (../pokecrystal-de, siehe dessen CLAUDE.md)

- Text-Engine EU: `<SHY>` ($1e) und `<-LF>` ($1d, PlaceHyphenSplit), Diakritika-Code entfernt, dict-Konstanten mit `jr .place`.
- Ja/Nein-Box 1 breiter, viele `hlcoord`-Verschiebungen, Pokédex-Größe 1 Byte (metrisch), Magikarp in mm, AP statt PP,
  Mystery-Gift-Regioncode $9f, Brief-Nationalität "EG", Map-Sign-Leerzeichen, Town-Map-Silbentrennung.
- Deutsche LZ-Grafiken oft `--literal-only --align 1`; Füllbytes nach LZ beachten.
- Labels können durch Verschiebungen "selbstbestätigend" falsche Texte bekommen → bei Duplikaten prüfen.

## Stand

- 2026-10-02: Setup. Gold baut, 69,4 % positionsgenau, 72,6 % strukturell.
